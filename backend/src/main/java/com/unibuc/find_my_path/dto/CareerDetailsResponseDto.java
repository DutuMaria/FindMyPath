package com.unibuc.find_my_path.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CareerDetailsResponseDto {
    private Long careerId;
    private String title;
    private String description;
    private String industry;
    private String salaryRange;
    private String experienceLevel;
    private List<String> requiredSoftSkills;
    private List<String> requiredHardSkills;
}
