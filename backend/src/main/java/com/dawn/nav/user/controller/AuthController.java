package com.dawn.nav.user.controller;

import com.dawn.nav.user.service.AuthService;
import com.dawn.nav.model.dto.TokenDTO;
import com.dawn.nav.model.po.Result;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
public class AuthController {
    private final AuthService authService;
    @PostMapping("/public/refreshToken")
    public Result<TokenDTO> refreshToken(@RequestParam String refreshToken) {
        TokenDTO tokenDTO = authService.refreshToken(refreshToken);
        return Result.success(tokenDTO);
    }
}
