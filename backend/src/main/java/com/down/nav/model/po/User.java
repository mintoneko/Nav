package com.down.nav.model.po;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    private Long id;
    private String username;
    private String email;
    private String phone;
    private String password;
    private String nickname;
    private Integer role;
    private String githubOpenid;
    private String linuxdoOpenid;
    private LocalDateTime createTime;
    private LocalDateTime updateTime;
}
