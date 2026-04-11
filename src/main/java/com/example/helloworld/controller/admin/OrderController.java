package com.example.helloworld.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class OrderController {
    @GetMapping("/admin/orders")
    public String getMethodName() {
        return "admin/orders";
    }

}
