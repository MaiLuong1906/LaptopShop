package com.example.helloworld.service;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.helloworld.domain.Role;
import com.example.helloworld.domain.User;
import com.example.helloworld.domain.dto.RegisterDTO;
import com.example.helloworld.repository.RoleRepository;
import com.example.helloworld.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, RoleRepository roleRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public User createUser(User user) {
        if (user.getRole() != null && user.getRole().getName() != null) {
            Role role = roleRepository.findByName(user.getRole().getName());
            user.setRole(role);
        }
        String hashPassword = passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        return userRepository.save(user);
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User getUserById(long id) {
        return userRepository.findById(id);
    }

    public void deleteUserById(long id) {
        userRepository.deleteById(id);
    }

    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    public boolean isEmailExist(String email) {
        return userRepository.existsByEmail(email);
    }

    public Role getRoleByName(String roleName) {
        return roleRepository.findByName(roleName);
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
}
