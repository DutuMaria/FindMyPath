package com.unibuc.find_my_path.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class ExperienceLevel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer experienceLevelId;

    @Column(nullable = false)
    private String experienceLevel;

    @OneToMany(mappedBy = "experienceLevel", cascade = CascadeType.ALL)
    private List<Career> careerList;
}
