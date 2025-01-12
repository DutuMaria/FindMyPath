package com.unibuc.find_my_path.service;

import com.unibuc.find_my_path.dto.LoginRequest;
import com.unibuc.find_my_path.dto.LoginResponseDto;
import com.unibuc.find_my_path.dto.RegisterRequest;
import com.unibuc.find_my_path.model.FindMyPathUser;
import com.unibuc.find_my_path.repository.FindMyPathUserRepository;
import com.unibuc.find_my_path.security.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Optional;
import java.util.UUID;

@Service
public class AuthService {
    @Autowired
    private FindMyPathUserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private JwtUtil jwtUtil;

    public String register(RegisterRequest request) {
        Optional<FindMyPathUser> existingUser = userRepository.findByEmail(request.getEmail());
        if (existingUser.isPresent()) {
            throw new RuntimeException("Email already in use");
        }

        FindMyPathUser user = new FindMyPathUser();
        user.setUserId(UUID.randomUUID());
        user.setEmail(request.getEmail());
        user.setFirstName(request.getFirstName());
        user.setLastName(request.getLastName());
        user.setIsAdmin(false);
        user.setPasswordHash(passwordEncoder.encode(request.getPassword()));
        userRepository.save(user);

        return "User registered successfully";
    }

    public LoginResponseDto login(LoginRequest request) {
        FindMyPathUser user = userRepository.findByEmail(request.getEmail())
                .orElseThrow(() -> new RuntimeException("User not found"));

        if (!passwordEncoder.matches(request.getPassword(), user.getPasswordHash())) {
            throw new RuntimeException("Invalid credentials");
        }

        return new LoginResponseDto(jwtUtil.generateToken(user.getEmail()), user.getUserId());
    }
}
