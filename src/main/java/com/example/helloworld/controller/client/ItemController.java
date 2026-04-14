package com.example.helloworld.controller.client;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.helloworld.domain.Cart;
import com.example.helloworld.domain.CartDetail;
import com.example.helloworld.domain.Order;
import com.example.helloworld.domain.Product;
import com.example.helloworld.domain.User;
import com.example.helloworld.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ItemController {
    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/products")
    public String getProductsPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (NumberFormatException e) {
        }
        Pageable pageable = PageRequest.of(page - 1, 6);
        Page<Product> productsPage = productService.getAllProducts(pageable);
        List<Product> productsList = productsPage.getContent();

        model.addAttribute("products", productsList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productsPage.getTotalPages());

        return "client/product/products";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable("id") long id, HttpServletRequest request,
            @RequestParam(value = "quantity", defaultValue = "1") int quantity) {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        if (email != null) {
            productService.handleAddProductToCart(email, id, quantity);
            // Cập nhật lại sum vào session để header hiển thị ngay
            Cart cart = productService.getCartByUserEmail(email);
            if (cart != null) {
                session.setAttribute("cartSum", cart.getSum());
            }
        }
        return "redirect:/cart";
    }

    @PostMapping("/buy-now/{id}")
    public String buyNowProduct(@PathVariable("id") long id, HttpServletRequest request,
            @RequestParam(value = "quantity", defaultValue = "1") int quantity) {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        if (email != null) {
            productService.handleAddProductToCart(email, id, quantity);
            Cart cart = productService.getCartByUserEmail(email);
            if (cart != null) {
                session.setAttribute("cartSum", cart.getSum());
            }
        }
        return "redirect:/cart";
    }

    @GetMapping("/cart")
    public String getCartPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        if (email != null) {
            Cart cart = productService.getCartByUserEmail(email);
            List<CartDetail> cartDetails = productService.getCartDetailsByCart(cart);

            double totalPrice = 0;
            if (cartDetails != null && !cartDetails.isEmpty()) {
                totalPrice = cartDetails.stream()
                        .mapToDouble(cd -> cd.getPrice() * cd.getQuantity())
                        .sum();
            }

            model.addAttribute("cart", cart);
            model.addAttribute("cartDetails", cartDetails);
            model.addAttribute("totalPrice", totalPrice);

            if (cart != null) {
                session.setAttribute("cartSum", cart.getSum());
            } else {
                session.setAttribute("cartSum", 0);
            }
        }

        return "client/cart/show";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.handleRemoveCartDetail(cartDetailId, session);
        return "redirect:/cart";
    }

    @PostMapping("/confirm-checkout")
    public String confirmCheckout(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @GetMapping("/checkout")
    public String getCheckoutPage(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        if (email == null) {
            return "redirect:/login"; // Must login to checkout
        }

        Cart cart = productService.getCartByUserEmail(email);
        List<CartDetail> cartDetails = productService.getCartDetailsByCart(cart);

        if (cartDetails == null || cartDetails.isEmpty()) {
            return "redirect:/cart"; // Empty cart should return to cart view
        }

        double totalPrice = cartDetails.stream()
                .mapToDouble(cd -> cd.getPrice() * cd.getQuantity())
                .sum();

        model.addAttribute("cart", cart);
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(HttpServletRequest request,
            @RequestParam("fullName") String fullName,
            @RequestParam("phone") String phone,
            @RequestParam("address") String address) {
        HttpSession session = request.getSession(false);
        User user = new User();
        long id = (long) session.getAttribute("id");
        user.setId(id);
        this.productService.handlePlaceOrder(user, session, fullName, phone, address);
        return "redirect:/order-history";
    }

    @GetMapping("/order-history")
    public String getOrderHistory(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }
        long id = (long) session.getAttribute("id");
        User user = new User();
        user.setId(id);
        model.addAttribute("orders", this.productService.getOrdersByUser(user));
        return "client/order/history";
    }

    @PostMapping("/cancel-order/{id}")
    public String cancelOrder(@PathVariable("id") long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id") == null) {
            return "redirect:/login";
        }
        Order order = productService.getOrderById(id);
        long userId = (long) session.getAttribute("id");

        // Only allow cancel if user owns the order and it's PENDING
        if (order != null && order.getUser().getId() == userId && "PENDING".equals(order.getStatus())) {
            productService.updateOrderStatus(order, "CANCELED");
        }
        return "redirect:/order-history";
    }
}
