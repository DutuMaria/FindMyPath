package com.unibuc.find_my_path.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class TestAttempt {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long testAttemptId;

    @Column(nullable = false)
    private LocalDateTime attemptDate;

    private Integer testRating;
    private Integer experienceRating;

    @Column(nullable = false)
    private Boolean isCompleted;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private FindMyPathUser user;

    @OneToOne(mappedBy = "testAttempt", cascade = CascadeType.ALL)
    private Result result;

    @ManyToMany
    @JoinTable(
            name = "test_attempt_answers",
            joinColumns = @JoinColumn(name = "test_attempt_id"),
            inverseJoinColumns = @JoinColumn(name = "answer_id")
    )
    private List<Answer> answerList;
}
