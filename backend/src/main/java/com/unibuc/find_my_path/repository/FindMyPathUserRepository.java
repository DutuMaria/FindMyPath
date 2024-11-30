package com.unibuc.find_my_path.repository;

import com.unibuc.find_my_path.model.FindMyPathUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface FindMyPathUserRepository extends JpaRepository<FindMyPathUser, UUID> {
}
