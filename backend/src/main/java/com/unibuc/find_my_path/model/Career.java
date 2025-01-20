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
public class Career {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long careerId;

    @Column(nullable = false)
    private String title;

    private String description;
    private String industry;
    private String salaryRange;

    @ManyToOne
    @JoinColumn(name = "experience_level_id")
    private ExperienceLevel experienceLevel;

    @ManyToMany
    @JoinTable(
            name = "required_soft_skills",
            joinColumns = @JoinColumn(name = "career_id"),
            inverseJoinColumns = @JoinColumn(name = "soft_skill_id")
    )
    private List<SoftSkill> softSkillList;

    @ManyToMany
    @JoinTable(
            name = "required_hard_skills",
            joinColumns = @JoinColumn(name = "career_id"),
            inverseJoinColumns = @JoinColumn(name = "hard_skill_id")
    )
    private List<HardSkill> hardSkillList;

    @ManyToMany
    @JoinTable(
            name = "required_interests",
            joinColumns = @JoinColumn(name = "career_id"),
            inverseJoinColumns = @JoinColumn(name = "interest_id")
    )
    private List<Interest> interestList;
}
