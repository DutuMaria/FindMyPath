package com.unibuc.find_my_path.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UpdateUserProfileRequestDto {
    @NotNull(message = "First name cannot be null.")
    @Size(min = 1, message = "First name must contain at least one character.")
    private String firstName;

    @NotNull(message = "Last name cannot be null.")
    @Size(min = 1, message = "Last name must contain at least one character.")
    private String lastName;
}
