package com.example.helloworld.controller.admin;

import java.util.List;
import java.util.Optional;

import javax.naming.Binding;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.helloworld.domain.Product;
import com.example.helloworld.service.ProductService;
import com.example.helloworld.service.UploadFileService;

import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadFileService uploadFileService;

    public ProductController(ProductService productService, UploadFileService uploadFileService) {
        this.productService = productService;
        this.uploadFileService = uploadFileService;
    }

    @GetMapping("/admin/products")
    public String getMethodName(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (NumberFormatException e) {
        }
        Pageable pageable = PageRequest.of(page - 1, 2);
        Page<Product> products = productService.getAllProducts(pageable);
        List<Product> productsList = products.getContent();
        model.addAttribute("products", productsList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", products.getTotalPages());
        return "admin/products";
    }

    @GetMapping("/product/detail/{id}")
    public String getProductDetail(@PathVariable("id") Long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/product-detail";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("product", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String postMethodName(Model model, @ModelAttribute("product") @Valid Product product,
            BindingResult bindingResult, @RequestParam("file") MultipartFile file) {
        // TODO: process POST request
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + ": " + error.getDefaultMessage());
        }

        if (bindingResult.hasErrors()) {
            return "admin/product/create";
        }
        String fileName = uploadFileService.saveFile("product", file);
        product.setImage(fileName);
        productService.saveProduct(product);
        return "redirect:/admin/products";
    }

    @GetMapping("/admin/product/update/{id}")
    public String getUpdatePage(@PathVariable("id") Long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(@ModelAttribute("product") Product product, Model model,
            @RequestParam(value = "file", required = false) MultipartFile file) {
        Product existingProduct = productService.getProductById(product.getId());
        if (existingProduct == null) {
            // Handle case where product doesn't exist
            return "redirect:/admin/products";
        }
        // Update fields of the existing product
        existingProduct.setName(product.getName());
        existingProduct.setPrice(product.getPrice());
        existingProduct.setQuantity(product.getQuantity());
        existingProduct.setShortDesc(product.getShortDesc());
        existingProduct.setDetailDecs(product.getDetailDecs());
        existingProduct.setFactory(product.getFactory());
        existingProduct.setTarget(product.getTarget());

        if (file != null && !file.isEmpty()) {
            String fileName = uploadFileService.saveFile("product", file);
            existingProduct.setImage(fileName);
        }

        productService.saveProduct(existingProduct);
        return "redirect:/admin/products";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeletePage(@PathVariable("id") Long id, Model model) {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("product") Product product) {
        // TODO: process POST request
        productService.deleteProductById(product.getId());
        return "redirect:/admin/products";
    }

}
