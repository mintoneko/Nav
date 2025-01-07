package com.dawn.nav.model.enums;

import lombok.Getter;

@Getter
public enum UserTypeEnum {
    BLOCK(0, "封禁"),
    ADMIN(2, "管理员"),
    USER(1, "用户");

    private Integer code;
    private String desc;

    UserTypeEnum(Integer code, String desc) {
        this.code = code;
        this.desc = desc;
    }

}
