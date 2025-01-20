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
public class Interest {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer interestId;

    @Column(nullable = false)
    private String interestName;

    @ManyToMany(mappedBy = "interestList")
    private List<Result> resultList;

    @ManyToMany(mappedBy = "interestList")
    private List<Career> careerList;

    @ManyToMany(mappedBy = "interestList")
    private List<Answer> answerList;
}
