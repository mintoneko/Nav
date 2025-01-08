package com.dawn.nav.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegisterDTO {
  private String email;
  private String code;
  private String password;
  private String rePassword;
}
