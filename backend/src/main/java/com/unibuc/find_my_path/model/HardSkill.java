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
public class HardSkill {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer hardSkillId;

    @Column(nullable = false)
    private String hardSkillName;

    @ManyToMany(mappedBy = "hardSkillList")
    private List<Result> resultList;

    @ManyToMany(mappedBy = "hardSkillList")
    private List<Career> careerList;

    @ManyToMany(mappedBy = "hardSkillList")
    private List<Answer> answerList;
}
