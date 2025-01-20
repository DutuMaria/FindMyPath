package com.unibuc.find_my_path.service;

import com.unibuc.find_my_path.model.SoftSkill;
import com.unibuc.find_my_path.repository.SoftSkillRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class SoftSkillService {
    private final SoftSkillRepository softSkillRepository;

    public ArrayList<String> getAllSoftSkillNames() {
        return softSkillRepository.findAll().stream()
                .map(SoftSkill::getSoftSkillName)
                .collect(Collectors.toCollection(ArrayList::new));
    }
}
