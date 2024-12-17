package com.unibuc.find_my_path.repository;

import com.unibuc.find_my_path.model.FindMyPathUser;
import com.unibuc.find_my_path.model.TestAttempt;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TestAttemptRepository extends JpaRepository<TestAttempt, Long> {
    boolean existsByUserAndIsCompletedFalse(FindMyPathUser user);
}
