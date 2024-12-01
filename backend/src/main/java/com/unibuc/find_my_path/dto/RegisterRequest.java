package com.unibuc.find_my_path.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class RegisterRequest {

//    @NotNull(message = "is required")
//    @Size(min = 1, message = "is required")
//    @Pattern(regexp="^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$",
//            message="Format email invalid.")
    private String email;

//    @NotNull(message = "is required")
//    @Size(min = 1, message = "is required")
    private String firstName;

//    @NotNull(message = "is required")
//    @Size(min = 1, message = "is required")
    private String lastName;

//    @NotNull(message = "is required")
//    @Size(min = 1, message = "is required")
//    @Pattern(regexp="^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$",
//            message="The password must include at least one uppercase letter, one lowercase letter, one special character, one number, and be at least 8 characters long")
    private String password;
}
