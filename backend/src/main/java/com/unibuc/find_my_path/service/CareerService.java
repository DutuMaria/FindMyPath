package com.unibuc.find_my_path.service;

import com.unibuc.find_my_path.model.Career;
import com.unibuc.find_my_path.repository.CareerRepository;
import com.unibuc.find_my_path.utils.Utils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CareerService {
    private final CareerRepository careerRepository;

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
