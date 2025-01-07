package com.dawn.nav.user.service;

import com.dawn.nav.model.dto.EmailDTO;

public interface EmailService {
    void sendMsg(EmailDTO emailDTO);
}
