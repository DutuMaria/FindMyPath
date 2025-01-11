package com.unibuc.find_my_path.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Education {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long educationId;

    @Column(nullable = false)
    private String certificate;

    private String institutionName;
    private LocalDate completionDate;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private FindMyPathUser user;
}
