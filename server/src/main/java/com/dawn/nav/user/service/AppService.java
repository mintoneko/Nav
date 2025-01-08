package com.dawn.nav.user.service;

import com.dawn.nav.model.dto.AppDTO;
import com.dawn.nav.model.vo.AppVO;
import com.dawn.nav.model.vo.AppXlsxVO;
import com.dawn.nav.model.vo.PageBeanVO;

import java.util.List;

public interface AppService {
  void addApp(AppDTO appDTO);

  void deleteApp(Long id);

  void updateApp(AppDTO appDTO);

  List<AppVO> getAppsByUsername(String username, Long categoryId);

  PageBeanVO<AppVO> getAppsPageNowUser(Integer pageNum, Integer pageSize, Long categoryId, Integer status, String searchContent);

  void clickApp(Long id);

  List<AppVO> getHotApps(String username);

  List<AppVO> searchApps(String searchContent, String username);

  void addAppXlsx(List<AppDTO> dataList);

  List<AppXlsxVO> downLoadAppsXlsx(Long userId);
}
