package com.dawn.nav.admin.controller;

import com.dawn.nav.admin.service.SettingService;
import com.dawn.nav.model.constant.SqlConstant;
import com.dawn.nav.model.dto.SettingDTO;
import com.dawn.nav.model.po.Result;
import com.dawn.nav.model.po.Setting;
import com.dawn.nav.model.vo.BottomVO;
import com.dawn.nav.model.vo.SiteVO;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
public class SettingController {
  private final SettingService settingService;

  @GetMapping("/public/setting")
  public Result<Setting> getSettingByKey(@RequestParam String key) {
    Setting setting = settingService.getByKey(key);
    return Result.success(setting);
  }

  @GetMapping("/public/setting/bottom")
  public Result<BottomVO> getSettingBottomByKey() {
    BottomVO bottomVO = new BottomVO(
            settingService.getByKey(SqlConstant.BOTTOM_COMPANY_NAME).getValueVarchar(),
            settingService.getByKey(SqlConstant.BOTTOM_ICP).getValueVarchar(),
            settingService.getByKey(SqlConstant.BOTTOM_POLICE).getValueVarchar()
    );
    return Result.success(bottomVO);
  }

  @GetMapping("/public/setting/site")
  public Result<SiteVO> getSettingSiteByKey() {
    SiteVO siteVO = new SiteVO(
            settingService.getByKey(SqlConstant.SITE_NAME).getValueVarchar(),
            settingService.getByKey(SqlConstant.SITE_LOGO).getValueVarchar(),
            settingService.getByKey(SqlConstant.SITE_GITHUB_LOGO).getValueVarchar()
    );
    return Result.success(siteVO);
  }

  @PostMapping("/admin/setting")
  public Result updateSetting(@RequestBody SettingDTO settingDTO) {
    settingService.updateSetting(settingDTO);
    return Result.success();
  }
}
