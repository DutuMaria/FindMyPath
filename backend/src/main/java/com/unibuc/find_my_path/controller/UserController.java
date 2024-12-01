package com.unibuc.find_my_path.controller;

import com.unibuc.find_my_path.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private UserService userService;

    @DeleteMapping("/delete")
    public ResponseEntity<String> deleteUserAccount(Authentication authentication) {
        try {
            String email = authentication.getName();
            userService.deleteUserByEmail(email);
            return ResponseEntity.ok("User account deleted successfully.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error deleting user account: " + e.getMessage());
        }
    }
}
