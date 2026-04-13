package com.example.helloworld.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.helloworld.domain.Order;
import com.example.helloworld.service.ProductService;

@Controller
public class OrderController {

    private final ProductService productService;

    public OrderController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/admin/orders")
    public String getOrders(Model model) {
        List<Order> orders = productService.getAllOrders();
        model.addAttribute("orders", orders);
        return "admin/order/orders";
    }

    @GetMapping("/admin/orders/view/{id}")
    public String getOrderView(Model model, @PathVariable("id") long id) {
        Order order = productService.getOrderById(id);
        model.addAttribute("order", order);
        return "admin/order/view";
    }

    @GetMapping("/admin/orders/update/{id}")
    public String getOrderUpdate(Model model, @PathVariable("id") long id) {
        Order order = productService.getOrderById(id);
        model.addAttribute("order", order);
        return "admin/order/update";
    }

    @PostMapping("/admin/orders/update")
    public String postOrderUpdate(@ModelAttribute("order") Order orderInfo) {
        Order order = productService.getOrderById(orderInfo.getId());
        if (order != null) {
            order.setStatus(orderInfo.getStatus());
            productService.updateOrder(order);
        }
        return "redirect:/admin/orders";
    }

    @GetMapping("/admin/orders/delete/{id}")
    public String getOrderDelete(Model model, @PathVariable("id") long id) {
        Order order = productService.getOrderById(id);
        model.addAttribute("order", order);
        return "admin/order/delete";
    }

    @PostMapping("/admin/orders/delete")
    public String postOrderDelete(@ModelAttribute("order") Order orderInfo) {
        productService.deleteOrderById(orderInfo.getId());
        return "redirect:/admin/orders";
    }
}
