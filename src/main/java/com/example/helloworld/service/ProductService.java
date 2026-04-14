package com.example.helloworld.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    public Page<Product> getAllProducts(Pageable pageable) {
        return productRepository.findAll(pageable);
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

    public void handleAddProductToCart(String email, long productId, int quantity) {
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
            if (product.getQuantity() < quantity)
                return; // Prevent adding if out of stock
            // Chưa có → tạo mới CartDetail
            CartDetail cartDetail = new CartDetail();
            cartDetail.setQuantity(quantity);
            cartDetail.setPrice(product.getPrice());
            cartDetail.setCart(cart);
            cartDetail.setProducts(product);
            cartDetailRepository.save(cartDetail);

            // Tăng tổng số lượng trong giỏ
            cart.setSum(cart.getSum() + 1);
            cartRepository.save(cart);
        } else {
            if (oldDetail.getQuantity() + quantity > product.getQuantity()) {
                oldDetail.setQuantity(product.getQuantity());
            } else {
                oldDetail.setQuantity(oldDetail.getQuantity() + quantity);
            }
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
                Product p = cartDetail1.getProducts();
                long maxAllowed = p.getQuantity();
                long requestedQuantity = cartDetail.getQuantity();
                cartDetail1.setQuantity(Math.min(requestedQuantity, maxAllowed));
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
        order.setStatus("PENDING");
        order = orderRepository.save(order);

        double totalPrice = 0;
        Cart cart = cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cartDetailRepository.findByCart(cart);
            if (cartDetails != null) {
                // First pass: cap quantity to limit
                for (CartDetail cartDetail : cartDetails) {
                    Product p = cartDetail.getProducts();
                    long maxAllowed = p.getQuantity();
                    if (cartDetail.getQuantity() > maxAllowed) {
                        cartDetail.setQuantity(maxAllowed);
                    }
                }

                for (CartDetail cartDetail : cartDetails) {
                    Product p = cartDetail.getProducts();
                    if (cartDetail.getQuantity() <= 0)
                        continue; // Skip out of stock

                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(p);
                    orderDetail.setQuantity(cartDetail.getQuantity());
                    orderDetail.setPrice(cartDetail.getPrice());
                    orderDetailRepository.save(orderDetail);

                    totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();

                    // Deduct stock and update sold
                    p.setQuantity(p.getQuantity() - cartDetail.getQuantity());
                    p.setSold(p.getSold() + cartDetail.getQuantity());
                    productRepository.save(p);
                }
                for (CartDetail cartDetail : cartDetails) {
                    cartDetailRepository.delete(cartDetail);
                }
                cart.setSum(0);
                cartRepository.save(cart);
                session.setAttribute("cartSum", 0);
            }
        }

        order.setTotalPrice(totalPrice);
        orderRepository.save(order);
    }

    public List<Order> getOrdersByUser(User user) {
        return orderRepository.findByUser(user);
    }

    public List<Order> getAllOrders() {
        return orderRepository.findAll();
    }

    public Order getOrderById(long id) {
        return orderRepository.findById(id).orElse(null);
    }

    public void updateOrderStatus(Order order, String newStatus) {
        String oldStatus = order.getStatus();

        if (!"CANCELED".equals(oldStatus) && "CANCELED".equals(newStatus)) {
            // Cancelled: Restore inventory
            for (OrderDetail detail : order.getOrderDetails()) {
                Product p = detail.getProduct();
                p.setQuantity(p.getQuantity() + detail.getQuantity());
                p.setSold(p.getSold() - detail.getQuantity());
                productRepository.save(p);
            }
        } else if ("CANCELED".equals(oldStatus) && !"CANCELED".equals(newStatus)) {
            // Un-cancelled: Re-deduct inventory
            for (OrderDetail detail : order.getOrderDetails()) {
                Product p = detail.getProduct();
                p.setQuantity(p.getQuantity() - detail.getQuantity());
                p.setSold(p.getSold() + detail.getQuantity());
                productRepository.save(p);
            }
        }

        order.setStatus(newStatus);
        orderRepository.save(order);
    }

    public void deleteOrderById(long id) {
        Optional<Order> orderOptional = orderRepository.findById(id);
        if (orderOptional.isPresent()) {
            Order order = orderOptional.get();
            List<OrderDetail> details = order.getOrderDetails();
            if (details != null) {
                for (OrderDetail detail : details) {
                    orderDetailRepository.deleteById(detail.getId());
                }
            }
            orderRepository.deleteById(id);
        }
    }

    public long countProducts() {
        return productRepository.count();
    }

    public long countOrders() {
        return orderRepository.count();
    }

    public Page<Order> getAllOrders(Pageable pageable) {
        return orderRepository.findAll(pageable);
    }
}
