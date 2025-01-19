package com.unibuc.find_my_path.controller;

import com.unibuc.find_my_path.dto.*;
import com.unibuc.find_my_path.service.UserService;
import jakarta.persistence.EntityNotFoundException;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/profile")
    public ResponseEntity<UserProfileResponseDto> getUserProfile(Principal principal) {
        UserProfileResponseDto response = userService.getUserProfile(principal.getName());

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }

    @GetMapping("/test-history")
    public ResponseEntity<List<UserTestResponseDto>> getUserTestAttempts(Principal principal) {
        List<UserTestResponseDto> response = userService.getUserTestAttempts(principal.getName());

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(response);
    }

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

    @PutMapping("/update-profile")
    public ResponseEntity<String> updateUserProfile(@RequestBody @Valid UpdateUserProfileRequestDto request, Principal principal) {
        try {
            userService.updateUserProfile(principal.getName(), request);
            return ResponseEntity.ok("Profile updated successfully.");
        } catch (EntityNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred while updating the profile.");
        }
    }

    @PutMapping("/reset-password")
    public ResponseEntity<String> resetPassword(@RequestBody @Valid ResetPasswordRequestDto request, Principal principal) {
        try {
            userService.resetPassword(principal.getName(), request);
            return ResponseEntity.ok("Password reset successfully.");
        } catch (EntityNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred while resetting the password.");
        }
    }

    @PostMapping("/add-skills")
    public ResponseEntity<String> addSkillsToUserProfile(@RequestBody @Valid AddSkillsRequestDto request, Principal principal) {
        try {
            userService.addSkillsToUserProfile(principal.getName(), request);
            return ResponseEntity.ok("Skills added successfully to your profile.");
        } catch (EntityNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("An error occurred while adding skills to the profile.");
        }
    }


    @GetMapping("/isAdmin")
    public ResponseEntity<Boolean> isAdmin(Authentication authentication) {
        String email = authentication.getName();
        boolean isAdmin = userService.isAdmin(email);
        return ResponseEntity
                .status(HttpStatus.OK)
                .body(isAdmin);
    }
}
