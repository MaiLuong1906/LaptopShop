package com.example.helloworld.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import com.example.helloworld.domain.User;
import com.example.helloworld.service.UploadFileService;
import com.example.helloworld.service.UserService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadFileService uploadFileService;

    public UserController(UserService userService, UploadFileService uploadFileService) {
        this.userService = userService;
        this.uploadFileService = uploadFileService;
    }

    @GetMapping("admin/users")
    public String getUserPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (NumberFormatException e) {
        }
        Pageable pageable = PageRequest.of(page - 1, 2);
        Page<User> userPage = userService.getAllUsers(pageable);
        model.addAttribute("users", userPage.getContent());
        model.addAttribute("currentPage", userPage.getNumber() + 1);
        model.addAttribute("totalPages", userPage.getTotalPages());
        return "admin/user/users";
    }

    @GetMapping("admin/users/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("user", new User());
        return "admin/user/create";
    }

    @PostMapping("/admin/users/create")
    public String createUser(Model model, @ModelAttribute("user") @Valid User user,
            BindingResult bindingResult,
            @RequestParam("file") MultipartFile file) {
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + ": " + error.getDefaultMessage());
        }

        if (bindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String fileName = uploadFileService.saveFile("avatar", file);
        user.setAvatar(fileName);
        userService.createUser(user);
        return "redirect:/admin/users";
    }

    @GetMapping("/admin/users/view/{id}")
    public String viewUser(Model model, @PathVariable("id") long id) {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/view";
    }

    @GetMapping("/admin/users/update/{id}")
    public String getUpdatePage(@PathVariable("id") long id, Model model) {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/update";
    }

    @PostMapping("/admin/users/update")
    public String updateUser(Model model, @ModelAttribute("user") User user) {
        User existingUser = userService.getUserById(user.getId());
        if (existingUser == null) {
            return "redirect:/admin/users"; // Handle the case where the user to be updated does not exist
        }
        existingUser.setFullName(user.getFullName());
        existingUser.setPassword(user.getPassword());
        existingUser.setAddress(user.getAddress());
        existingUser.setPhone(user.getPhone());
        userService.createUser(existingUser);
        return "redirect:/admin/users";
    }

    @GetMapping("/admin/users/delete/{id}")
    public String deleteUser(Model model, @PathVariable("id") long id) {
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "admin/user/delete";
    }

    @PostMapping("/admin/users/delete")
    public String deleteUser(Model model, @ModelAttribute("user") User user) {
        userService.deleteUserById(user.getId());
        return "redirect:/admin/users";
    }
}
