package com.unibuc.find_my_path;

import com.unibuc.find_my_path.dto.RegisterRequest;
import com.unibuc.find_my_path.model.FindMyPathUser;
import com.unibuc.find_my_path.repository.FindMyPathUserRepository;
import com.unibuc.find_my_path.service.AuthService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.ArgumentCaptor;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Optional;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.assertj.core.api.AssertionsForClassTypes.assertThatThrownBy;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class RegisterServiceTest {
    @Mock
    private FindMyPathUserRepository userRepository;

    @Mock
    private PasswordEncoder passwordEncoder;

    @InjectMocks
    private AuthService authService;

    private RegisterRequest registerRequest;

    @BeforeEach
    void setUp() {
        registerRequest = new RegisterRequest();
        registerRequest.setEmail("test@example.com");
        registerRequest.setFirstName("John");
        registerRequest.setLastName("Doe");
        registerRequest.setPassword("Password123!");
    }

    @Test
    void register_shouldSaveUser_whenEmailIsNotTaken() {
        when(userRepository.findByEmail(registerRequest.getEmail())).thenReturn(Optional.empty());
        when(passwordEncoder.encode(registerRequest.getPassword())).thenReturn("hashed-password");

        String result = authService.register(registerRequest);

        assertThat(result).isEqualTo("User registered successfully");
        ArgumentCaptor<FindMyPathUser> userCaptor = ArgumentCaptor.forClass(FindMyPathUser.class);
        verify(userRepository).save(userCaptor.capture());

        FindMyPathUser savedUser = userCaptor.getValue();
        assertThat(savedUser.getEmail()).isEqualTo(registerRequest.getEmail());
        assertThat(savedUser.getFirstName()).isEqualTo(registerRequest.getFirstName());
        assertThat(savedUser.getLastName()).isEqualTo(registerRequest.getLastName());
        assertThat(savedUser.getPasswordHash()).isEqualTo("hashed-password");
        assertThat(savedUser.getIsAdmin()).isFalse();
    }

    @Test
    void register_shouldThrowException_whenEmailIsAlreadyInUse() {
        FindMyPathUser existingUser = new FindMyPathUser();
        existingUser.setEmail(registerRequest.getEmail());

        when(userRepository.findByEmail(registerRequest.getEmail())).thenReturn(Optional.of(existingUser));

        assertThatThrownBy(() -> authService.register(registerRequest))
                .isInstanceOf(RuntimeException.class)
                .hasMessage("Email already in use");

        verify(userRepository, never()).save(any());
    }

    @Test
    void register_shouldHashPassword_beforeSavingUser() {
        when(userRepository.findByEmail(registerRequest.getEmail())).thenReturn(Optional.empty());
        when(passwordEncoder.encode(registerRequest.getPassword())).thenReturn("hashed-password");

        authService.register(registerRequest);

        verify(passwordEncoder).encode(registerRequest.getPassword());
    }
}
