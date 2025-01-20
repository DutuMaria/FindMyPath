package com.unibuc.find_my_path.service;

import com.unibuc.find_my_path.model.Interest;
import com.unibuc.find_my_path.repository.InterestRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class InterestService {
    private final InterestRepository interestRepository;

    public ArrayList<String> getAllInterestNames() {
        return interestRepository.findAll().stream()
                .map(Interest::getInterestName)
                .collect(Collectors.toCollection(ArrayList::new));
    }
}
