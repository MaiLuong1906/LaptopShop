package com.example.helloworld.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.example.helloworld.domain.Cart;
import com.example.helloworld.domain.CartDetail;
import com.example.helloworld.domain.Order;
import com.example.helloworld.domain.OrderDetail;
import com.example.helloworld.domain.Product;
import com.example.helloworld.domain.User;
import com.example.helloworld.repository.CartDetailRepository;
import com.example.helloworld.repository.CartRepository;
import com.example.helloworld.repository.OrderDetailRepository;
import com.example.helloworld.repository.OrderRepository;
import com.example.helloworld.repository.ProductRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService, OrderRepository orderRepository,
            OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    public Product saveProduct(Product product) {
        return productRepository.save(product);
    }

    public Product getProductById(long id) {
        return productRepository.findById(id);
    }

    public void deleteProductById(long id) {
        productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId) {
        // B1: Lấy ra user theo email
        User user = userService.findByEmail(email);
        if (user == null)
            return;

        // B2: Lấy hoặc tạo Cart cho user
        Cart cart = cartRepository.findByUser(user);
        if (cart == null) {
            Cart newCart = new Cart();
            newCart.setUser(user);
            newCart.setSum(0);
            // FIX: gán lại kết quả save() để có entity đã được persist (có ID)
            cart = cartRepository.save(newCart);
        }

        // B3: Lấy ra sản phẩm
        Product product = productRepository.findById(productId);
        if (product == null)
            return;

        // B4: Kiểm tra sản phẩm đã từng được thêm vào giỏ hàng chưa
        CartDetail oldDetail = cartDetailRepository.findByCartAndProducts(cart, product);

        if (oldDetail == null) {
            // Chưa có → tạo mới CartDetail
            CartDetail cartDetail = new CartDetail();
            cartDetail.setQuantity(1);
            cartDetail.setPrice(product.getPrice());
            cartDetail.setCart(cart);
            cartDetail.setProducts(product);
            cartDetailRepository.save(cartDetail);

            // Tăng tổng số lượng trong giỏ
            cart.setSum(cart.getSum() + 1);
            cartRepository.save(cart);
        } else {
            // Đã có → chỉ tăng số lượng
            oldDetail.setQuantity(oldDetail.getQuantity() + 1);
            cartDetailRepository.save(oldDetail);
        }
    }

    public Cart getCartByUserEmail(String email) {
        User user = userService.findByEmail(email);
        if (user != null) {
            return cartRepository.findByUser(user);
        }
        return null;
    }

    public List<CartDetail> getCartDetailsByCart(Cart cart) {
        if (cart != null) {
            return cartDetailRepository.findByCart(cart);
        }
        return null;
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = cartDetailRepository.findById(cartDetailId);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();

            Cart currentCart = cartDetail.getCart();
            cartDetailRepository.deleteById(cartDetailId);

            cartDetail.setCart(null);
            // Cập nhật lại giỏ hàng dựa trên số lượng thực tế còn lại trong DB
            Cart cartFromDB = cartRepository.findById(currentCart.getId()).orElse(null);
            if (cartFromDB != null) {
                List<CartDetail> remainingDetails = cartDetailRepository.findByCart(cartFromDB);
                if (remainingDetails == null || remainingDetails.isEmpty()) {
                    // KHÔNG XÓA cartFromDB để tránh lỗi TransientObjectException với User
                    cartFromDB.setSum(0);
                    cartRepository.save(cartFromDB);
                    session.setAttribute("cartSum", 0);
                } else {
                    cartFromDB.setSum(remainingDetails.size());
                    session.setAttribute("cartSum", remainingDetails.size());
                    cartRepository.save(cartFromDB);
                }
            }
        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cartDetailFromDB = cartDetailRepository.findById(cartDetail.getId());
            if (cartDetailFromDB.isPresent()) {
                CartDetail cartDetail1 = cartDetailFromDB.get();
                cartDetail1.setQuantity(cartDetail.getQuantity());
                cartDetailRepository.save(cartDetail1);
            }
        }
    }

    public void handlePlaceOrder(User user, HttpSession session, String fullName, String phone, String address) {
        Order order = new Order();
        order.setUser(user);
        order.setReceiverName(fullName);
        order.setReceiverAddress(address);
        order.setReceiverPhone(phone);
        order = orderRepository.save(order);

        Cart cart = cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cartDetailRepository.findByCart(cart);
            if (cartDetails != null) {
                for (CartDetail cartDetail : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cartDetail.getProducts());
                    orderDetail.setQuantity(cartDetail.getQuantity());
                    orderDetail.setPrice(cartDetail.getPrice());
                    orderDetailRepository.save(orderDetail);
                }
                for (CartDetail cartDetail : cartDetails) {
                    cartDetailRepository.delete(cartDetail);
                }
                cart.setSum(0);
                cartRepository.save(cart);
                session.setAttribute("cartSum", 0);
            }
        }

    }
}
