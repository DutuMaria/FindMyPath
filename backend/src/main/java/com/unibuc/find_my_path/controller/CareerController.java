package com.unibuc.find_my_path.controller;

import com.unibuc.find_my_path.dto.CareerDetailsResponseDto;
import com.unibuc.find_my_path.service.CareerService;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/careers")
@RequiredArgsConstructor
public class CareerController {
    private final CareerService careerService;

    @GetMapping("/{id}")
    public ResponseEntity<CareerDetailsResponseDto> getCareerDetails(@PathVariable Long id) {
        try {
            CareerDetailsResponseDto response = careerService.getCareerDetailsById(id);
            return ResponseEntity.ok(response);
        } catch (EntityNotFoundException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
}
