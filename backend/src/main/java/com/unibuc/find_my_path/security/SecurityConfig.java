package com.unibuc.find_my_path.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.LogoutConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(AbstractHttpConfigurer::disable) // disabled for testing (postman)

                .authorizeHttpRequests(configurer ->
                        configurer
                                .requestMatchers("/api/auth/register").permitAll()
                                .requestMatchers("/api/auth/login").permitAll()
                                .anyRequest().authenticated() // all other endpoints require authentication


                )
                .logout(LogoutConfigurer::permitAll);

        return http.build();
    }
}
