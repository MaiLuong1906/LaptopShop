package com.example.helloworld.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.helloworld.domain.Product;
import com.example.helloworld.domain.User;
import com.example.helloworld.domain.dto.RegisterDTO;
import com.example.helloworld.service.ProductService;
import com.example.helloworld.service.UserService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.RequestBody;

@Controller
public class HomeController {
    private final ProductService productService;
    private final UserService userService;

    public HomeController(ProductService productService, UserService userService) {
        this.productService = productService;
        this.userService = userService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);
        return "client/homepage/home";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(Model model, @ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }
        User user = userService.registerDTOtoUser(registerDTO);
        user.setRole(userService.getRoleByName("USER"));
        userService.createUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        model.addAttribute("loginUser", new RegisterDTO());
        return "client/auth/login";
    }

}
