package com.unibuc.find_my_path.service;

import com.unibuc.find_my_path.dto.EducationResponseDto;
import com.unibuc.find_my_path.dto.UserProfileResponseDto;
import com.unibuc.find_my_path.model.FindMyPathUser;
import com.unibuc.find_my_path.repository.FindMyPathUserRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private FindMyPathUserRepository userRepository;

    public UserProfileResponseDto getUserProfile(String email) {
        FindMyPathUser user = userRepository.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("User with email " + email + " not found"));

        return new UserProfileResponseDto(
                user.getEmail(),
                user.getFirstName(),
                user.getLastName(),
                user.getEducationList() != null ? user.getEducationList().stream()
                        .map(education -> {
                            return new EducationResponseDto(
                                    education.getCertificate(),
                                    education.getCompletionDate(),
                                    education.getInstitutionName()
                            );
                        })
                        .toList()
                        : null
        );
    }

    public void deleteUserByEmail(String email) {
        FindMyPathUser user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));
        userRepository.delete(user);
    }
}
