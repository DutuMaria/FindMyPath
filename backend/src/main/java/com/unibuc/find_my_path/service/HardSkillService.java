package com.unibuc.find_my_path.service;

import com.unibuc.find_my_path.model.HardSkill;
import com.unibuc.find_my_path.repository.HardSkillRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class HardSkillService {
    private final HardSkillRepository hardSkillRepository;

    public ArrayList<String> getAllHardSkillNames() {
        return hardSkillRepository.findAll().stream()
                .map(HardSkill::getHardSkillName)
                .collect(Collectors.toCollection(ArrayList::new));
    }
}
