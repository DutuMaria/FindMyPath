package com.unibuc.find_my_path;

import com.unibuc.find_my_path.dto.LoginRequest;
import com.unibuc.find_my_path.dto.LoginResponseDto;
import com.unibuc.find_my_path.model.FindMyPathUser;
import com.unibuc.find_my_path.repository.FindMyPathUserRepository;
import com.unibuc.find_my_path.security.JwtUtil;
import com.unibuc.find_my_path.service.AuthService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.Optional;
import java.util.UUID;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.assertj.core.api.AssertionsForClassTypes.assertThatThrownBy;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class AuthServiceTest {

    @Mock
    private FindMyPathUserRepository userRepository;

    @Mock
    private PasswordEncoder passwordEncoder;

    @Mock
    private JwtUtil jwtUtil;

    @InjectMocks
    private AuthService authService;

    private LoginRequest loginRequest;

    @BeforeEach
    void setUp() {
        loginRequest = new LoginRequest();
        loginRequest.setEmail("test@example.com");
        loginRequest.setPassword("password123");
    }

    @Test
    void login_shouldReturnTokenAndUserId_whenCredentialsAreCorrect() {
        UUID userId = UUID.randomUUID();
        FindMyPathUser user = new FindMyPathUser();
        user.setUserId(userId);
        user.setEmail("test@example.com");
        user.setPasswordHash("$2a$10$eW5HM6Ujpjx.bZ/3rkKK5OF3QpTIHzGh7Ys3WtMkEyT63/oRCKjaK"); // BCrypt hash -> "password123"

        when(userRepository.findByEmail(loginRequest.getEmail()))
                .thenReturn(Optional.of(user));
        when(passwordEncoder.matches(loginRequest.getPassword(), user.getPasswordHash()))
                .thenReturn(true);
        when(jwtUtil.generateToken(user.getEmail()))
                .thenReturn("mocked-jwt-token");

        LoginResponseDto response = authService.login(loginRequest);

        assertThat(response.getToken()).isEqualTo("mocked-jwt-token");
        assertThat(response.getUserId()).isEqualTo(userId);

    }

    @Test
    void login_shouldThrowException_whenUserNotFound() {
        when(userRepository.findByEmail(loginRequest.getEmail()))
                .thenReturn(Optional.empty());

        assertThatThrownBy(() -> authService.login(loginRequest))
                .isInstanceOf(RuntimeException.class)
                .hasMessage("User not found");
    }

    @Test
    void login_shouldThrowException_whenPasswordIsIncorrect() {
        FindMyPathUser user = new FindMyPathUser();
        user.setEmail("test@example.com");
        user.setPasswordHash("$2a$10$eW5HM6Ujpjx.bZ/3rkKK5OF3QpTIHzGh7Ys3WtMkEyT63/oRCKjaK");

        when(userRepository.findByEmail(loginRequest.getEmail()))
                .thenReturn(Optional.of(user));
        when(passwordEncoder.matches(loginRequest.getPassword(), user.getPasswordHash()))
                .thenReturn(false);

        assertThatThrownBy(() -> authService.login(loginRequest))
                .isInstanceOf(RuntimeException.class)
                .hasMessage("Invalid credentials");
    }

    @Test
    void login_shouldCallJwtUtilGenerateToken() {
        FindMyPathUser user = new FindMyPathUser();
        user.setEmail("test@example.com");
        user.setPasswordHash("$2a$10$eW5HM6Ujpjx.bZ/3rkKK5OF3QpTIHzGh7Ys3WtMkEyT63/oRCKjaK");

        when(userRepository.findByEmail(loginRequest.getEmail()))
                .thenReturn(Optional.of(user));
        when(passwordEncoder.matches(loginRequest.getPassword(), user.getPasswordHash()))
                .thenReturn(true);

        authService.login(loginRequest);

        verify(jwtUtil).generateToken(user.getEmail());
    }

}
