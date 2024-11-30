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
public class Result {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long resultId;

    private int compatibilityPercentage;

    @OneToOne
    @JoinColumn(name = "test_attempt_id")
    private TestAttempt testAttempt;

    @ManyToMany
    @JoinTable(
            name = "result_interests",
            joinColumns = @JoinColumn(name = "result_id"),
            inverseJoinColumns = @JoinColumn(name = "interest_id")
    )
    private List<Interest> interestList;

    @ManyToMany
    @JoinTable(
            name = "result_soft_skills",
            joinColumns = @JoinColumn(name = "result_id"),
            inverseJoinColumns = @JoinColumn(name = "soft_skill_id")
    )
    private List<SoftSkill> softSkillList;

    @ManyToMany
    @JoinTable(
            name = "result_hard_skills",
            joinColumns = @JoinColumn(name = "result_id"),
            inverseJoinColumns = @JoinColumn(name = "hard_skill_id")
    )
    private List<HardSkill> hardSkillList;
}
