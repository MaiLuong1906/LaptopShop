package com.example.helloworld.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.helloworld.service.ProductService;
import com.example.helloworld.service.UserService;

@Controller
public class DashboardController {
    private final ProductService productService;
    private final UserService userService;

    public DashboardController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("totalProducts", productService.countProducts());
        model.addAttribute("totalOrders", productService.countOrders());
        model.addAttribute("totalUsers", userService.countUsers());
        return "admin/dashboard";
    }
}
