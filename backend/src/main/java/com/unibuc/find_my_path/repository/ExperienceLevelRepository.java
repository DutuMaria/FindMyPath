package com.unibuc.find_my_path.repository;

import com.unibuc.find_my_path.model.ExperienceLevel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ExperienceLevelRepository extends JpaRepository<ExperienceLevel, Integer> {
}
