package com.unibuc.find_my_path;

import com.unibuc.find_my_path.dto.CareerDetailsResponseDto;
import com.unibuc.find_my_path.model.*;
import com.unibuc.find_my_path.repository.CareerRepository;
import com.unibuc.find_my_path.service.CareerService;
import jakarta.persistence.EntityNotFoundException;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

import static org.assertj.core.api.AssertionsForClassTypes.assertThatThrownBy;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class CareerServiceTest {
    @Mock
    private CareerRepository careerRepository;

    @InjectMocks
    private CareerService careerService;

    private Career career;

    @BeforeEach
    void setUp() {
        career = new Career();
        career.setCareerId(1L);
        career.setTitle("Software Engineer");
        career.setDescription("Develop and maintain software systems.");
        career.setIndustry("Technology");
        career.setSalaryRange("70,000-100,000 USD");

        ExperienceLevel experienceLevel = new ExperienceLevel();
        experienceLevel.setExperienceLevelId(1);
        experienceLevel.setExperienceLevel("Mid-Level");
        career.setExperienceLevel(experienceLevel);

        SoftSkill softSkill1 = new SoftSkill(1, "Communication", null, null);
        SoftSkill softSkill2 = new SoftSkill(2, "Teamwork", null, null);
        career.setSoftSkillList(List.of(softSkill1, softSkill2));

        HardSkill hardSkill1 = new HardSkill(1, "Java", null, null);
        HardSkill hardSkill2 = new HardSkill(2, "Spring Boot", null, null);
        career.setHardSkillList(List.of(hardSkill1, hardSkill2));
    }

    @Test
    void getCareerDetailsById_shouldThrowException_whenCareerNotFound() {
        when(careerRepository.findById(1L)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> careerService.getCareerDetailsById(1L))
                .isInstanceOf(EntityNotFoundException.class)
                .hasMessage("Career with id 1 not found.");
    }

    @Test
    void getCareerDetailsById_shouldReturnCareerDetails_whenCareerExists() {
        when(careerRepository.findById(1L)).thenReturn(Optional.of(career));

        CareerDetailsResponseDto result = careerService.getCareerDetailsById(1L);

        assertThat(result.getCareerId()).isEqualTo(1L);
        assertThat(result.getTitle()).isEqualTo("Software Engineer");
        assertThat(result.getDescription()).isEqualTo("Develop and maintain software systems.");
        assertThat(result.getIndustry()).isEqualTo("Technology");
        assertThat(result.getSalaryRange()).isEqualTo("70,000-100,000 USD");
        assertThat(result.getExperienceLevel()).isEqualTo("Mid-Level");
        assertThat(result.getRequiredSoftSkills())
                .hasSameElementsAs(List.of("Communication", "Teamwork"));
        assertThat(result.getRequiredHardSkills())
                .hasSameElementsAs(List.of("Java", "Spring Boot"));
    }

}
