package com.example.helloworld.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.helloworld.domain.Cart;
import com.example.helloworld.domain.CartDetail;
import com.example.helloworld.domain.Product;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {

    // "products" phải khớp đúng tên field trong CartDetail.java
    CartDetail findByCartAndProducts(Cart cart, Product products);

    // Lấy tất cả CartDetail của một giỏ hàng
    List<CartDetail> findByCart(Cart cart);
}
