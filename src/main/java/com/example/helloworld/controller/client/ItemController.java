package com.example.helloworld.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.helloworld.domain.Cart;
import com.example.helloworld.domain.CartDetail;
import com.example.helloworld.domain.User;
import com.example.helloworld.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ItemController {
    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable("id") long id, HttpServletRequest request) {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        if (email != null) {
            productService.handleAddProductToCart(email, id);
            // Cập nhật lại sum vào session để header hiển thị ngay
            Cart cart = productService.getCartByUserEmail(email);
            if (cart != null) {
                session.setAttribute("cartSum", cart.getSum());
            }
        }
        return "redirect:/";
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
        return "redirect:/";
    }
}
