package com.unibuc.find_my_path.service;

import com.unibuc.find_my_path.dto.*;
import com.unibuc.find_my_path.model.FindMyPathUser;
import com.unibuc.find_my_path.model.HardSkill;
import com.unibuc.find_my_path.model.SoftSkill;
import com.unibuc.find_my_path.repository.FindMyPathUserRepository;
import com.unibuc.find_my_path.repository.HardSkillRepository;
import com.unibuc.find_my_path.repository.SoftSkillRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private FindMyPathUserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    @Autowired
    private SoftSkillRepository softSkillRepository;
    @Autowired
    private HardSkillRepository hardSkillRepository;

    public UserService(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    public UserProfileResponseDto getUserProfile(String email) {
        FindMyPathUser user = userRepository.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("User with email " + email + " not found"));

        return new UserProfileResponseDto(
                user.getEmail(),
                user.getFirstName(),
                user.getLastName(),
                user.getEducationList() != null ? user.getEducationList().stream()
                        .sorted((e1, e2) -> e2.getCompletionDate().compareTo(e1.getCompletionDate()))
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

    public List<UserTestResponseDto> getUserTestAttempts(String email) {
        FindMyPathUser user = userRepository.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("User with email " + email + " not found"));

        return user.getTestAttemptList().stream()
                .sorted((t1, t2) -> t2.getAttemptDate().compareTo(t1.getAttemptDate()))
                .map(testAttempt -> {
                    return new UserTestResponseDto(
                            testAttempt.getTestAttemptId(),
                            testAttempt.getAttemptDate(),
                            testAttempt.getTestRating(),
                            testAttempt.getExperienceRating(),
                            testAttempt.getIsCompleted()
                    );
                })
                .toList();
    }

    public void deleteUserByEmail(String email) {
        FindMyPathUser user = userRepository.findByEmail(email)
                .orElseThrow(() -> new RuntimeException("User not found"));
        userRepository.delete(user);
    }

    public void updateUserProfile(String email, UpdateUserProfileRequestDto request) {
        FindMyPathUser user = userRepository.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("User with email " + email + " not found."));

        user.setFirstName(request.getFirstName());
        user.setLastName(request.getLastName());
        userRepository.save(user);
    }

    public void resetPassword(String email, ResetPasswordRequestDto request) {
        FindMyPathUser user = userRepository.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("User with email " + email + " not found."));

        if (!passwordEncoder.matches(request.getOldPassword(), user.getPasswordHash())) {
            throw new IllegalArgumentException("Old password is incorrect.");
        }

        user.setPasswordHash(passwordEncoder.encode(request.getNewPassword()));
        userRepository.save(user);
    }

    public void addSkillsToUserProfile(String email, AddSkillsRequestDto request) {
        FindMyPathUser user = userRepository.findByEmail(email)
                .orElseThrow(() -> new EntityNotFoundException("User with email " + email + " not found."));

        if (request.getSoftSkillIds() != null) {
            List<SoftSkill> softSkills = softSkillRepository.findAllById(request.getSoftSkillIds());
            user.getSoftSkills().addAll(softSkills);
        }

        if (request.getHardSkillIds() != null) {
            List<HardSkill> hardSkills = hardSkillRepository.findAllById(request.getHardSkillIds());
            user.getHardSkills().addAll(hardSkills);
        }

        userRepository.save(user);
    }
}
