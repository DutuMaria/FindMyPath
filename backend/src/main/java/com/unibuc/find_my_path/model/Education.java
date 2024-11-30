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
    private long educationId;

    private String certificate;
    private String institutionName;
    private LocalDate completionDate;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private FindMyPathUser user;
}
