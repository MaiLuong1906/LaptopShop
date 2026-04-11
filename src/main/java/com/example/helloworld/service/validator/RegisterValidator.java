package com.example.helloworld.service.validator;

import org.springframework.stereotype.Service;

import com.example.helloworld.domain.User;
import com.example.helloworld.domain.dto.RegisterDTO;
import com.example.helloworld.service.UserService;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

@Service
public class RegisterValidator implements ConstraintValidator<RegisterChecked, RegisterDTO> {
    private final UserService userService;

    public RegisterValidator(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean isValid(RegisterDTO user, ConstraintValidatorContext context) {
        boolean isValid = true;
        if (!user.getPassword().equals(user.getConfirmPassword())) {
            context.buildConstraintViolationWithTemplate("Password and Confirm Password do not match.")
                    .addPropertyNode("confirmPassword")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            ;
            isValid = false;
        }

        if (userService.isEmailExist(user.getEmail())) {
            context.buildConstraintViolationWithTemplate("Email already exists.")
                    .addPropertyNode("email")
                    .addConstraintViolation()
                    .disableDefaultConstraintViolation();
            ;
            isValid = false;
        }
        return isValid;
    }

}
