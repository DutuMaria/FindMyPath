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
public class SoftSkill {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer softSkillId;

    @Column(nullable = false)
    private String softSkillName;

    @ManyToMany(mappedBy = "softSkillList")
    private List<Result> resultList;

    @ManyToMany(mappedBy = "softSkillList")
    private List<Career> careerList;
}
