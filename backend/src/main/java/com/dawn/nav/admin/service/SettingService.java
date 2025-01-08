package com.dawn.nav.admin.service;

import com.dawn.nav.model.dto.SettingDTO;
import com.dawn.nav.model.po.Setting;
import org.springframework.stereotype.Service;

@Service
public interface SettingService {
  Setting getByKey(String key);

  void updateSetting(SettingDTO settingDTO);
}
