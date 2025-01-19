package com.unibuc.find_my_path.service;

import com.unibuc.find_my_path.dto.CareerDetailsResponseDto;
import com.unibuc.find_my_path.model.Career;
import com.unibuc.find_my_path.model.HardSkill;
import com.unibuc.find_my_path.model.SoftSkill;
import com.unibuc.find_my_path.repository.CareerRepository;
import com.unibuc.find_my_path.utils.Utils;
import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CareerService {
    private final CareerRepository careerRepository;

    public CareerDetailsResponseDto getCareerDetailsById(Long careerId) {
        Career career = careerRepository.findById(careerId)
                .orElseThrow(() -> new EntityNotFoundException("Career with id " + careerId + " not found."));

        return new CareerDetailsResponseDto(
                career.getCareerId(),
                career.getTitle(),
                career.getDescription(),
                career.getIndustry(),
                career.getSalaryRange(),
                career.getExperienceLevel() != null ? career.getExperienceLevel().getExperienceLevel() : null,
                career.getSoftSkillList() != null ?
                        career.getSoftSkillList().stream()
                                .map(SoftSkill::getSoftSkillName)
                                .toList() : null,
                career.getHardSkillList() != null ?
                        career.getHardSkillList().stream()
                                .map(HardSkill::getHardSkillName)
                                .toList() : null
        );
    }

    public ArrayList<ArrayList<ArrayList<String>>> getCareersSkillSet() {
        return careerRepository.findAll().stream()
                .map(career -> Utils.processSkillLists(
                        career.getHardSkillList(),
                        career.getSoftSkillList(),
                        career.getInterestList()))
                .collect(Collectors.toCollection(ArrayList::new));
    }

    public ArrayList<Long> getCareerIds() {
        return careerRepository.findAll().stream()
                .map(Career::getCareerId)
                .collect(Collectors.toCollection(ArrayList::new));
    }
}
