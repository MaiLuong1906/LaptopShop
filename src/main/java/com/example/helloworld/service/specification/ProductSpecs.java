package com.example.helloworld.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.example.helloworld.domain.Product;
import com.example.helloworld.domain.Product_;

public class ProductSpecs {
    public static Specification<Product> nameLike(String name) {
        return (root, query, builder) -> builder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    public static Specification<Product> matchFactory(List<String> factory) {
        return (root, query, builder) -> root.get(Product_.FACTORY).in(factory);
    }

    public static Specification<Product> matchTarget(List<String> target) {
        return (root, query, builder) -> root.get(Product_.TARGET).in(target);
    }

    public static Specification<Product> matchMinPrice(double minPrice) {
        return (root, query, builder) -> builder.greaterThanOrEqualTo(root.get(Product_.PRICE), minPrice);
    }

    public static Specification<Product> matchMaxPrice(double maxPrice) {
        return (root, query, builder) -> builder.lessThanOrEqualTo(root.get(Product_.PRICE), maxPrice);
    }
}
