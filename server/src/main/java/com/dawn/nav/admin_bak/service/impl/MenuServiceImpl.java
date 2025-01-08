package com.dawn.nav.admin_bak.service.impl;

import com.dawn.nav.admin_bak.mapper.MenuMapper;
import com.dawn.nav.admin_bak.service.MenuService;
import com.dawn.nav.exception.ExceptionTool;
import com.dawn.nav.model.dto.MenuDTO;
import com.dawn.nav.model.po.Menu;
import com.dawn.nav.util.CopyUtil;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class MenuServiceImpl implements MenuService {
  private final MenuMapper menuMapper;

  @Override
  public void addMenu(MenuDTO menuDTO) {
    log.info("addMenu:{}", menuDTO);
    if (menuDTO == null) {
      ExceptionTool.throwException("参数不能为空！");
    }
    assert menuDTO != null;
    if (menuDTO.getType() == null) {
      ExceptionTool.throwException("type 不能为空！");
    }
    if (menuDTO.getTitle().isEmpty()) {
      ExceptionTool.throwException("title 不能为空！");
    }
    if (menuDTO.getUrl().isEmpty()) {
      ExceptionTool.throwException("url 不能为空！");
    }
    Menu menu = CopyUtil.copy(menuDTO, Menu.class);
    menu.setCreateTime(LocalDateTime.now());
    menuMapper.addMenu(menu);
  }

  @Override
  public void delMenu(Integer id) {
    menuMapper.delMenuById(id);
  }

  @Override
  public void updateMenu(MenuDTO menuDTO) {
    Menu menu = getMenuById(menuDTO.getId());
    if (menu == null) {
      ExceptionTool.throwException("Menu 不存在！");
    }
    menu.setTitle(menuDTO.getTitle());
    menu.setUrl(menuDTO.getUrl());
    menu.setType(menuDTO.getType());
    menu.setWeight(menuDTO.getWeight());
    menuMapper.updateMenu(menu);
  }

  @Override
  public List<Menu> listMenu(Integer type) {
    return menuMapper.getByType(type);
  }

  private Menu getMenuById(Integer id) {
    return menuMapper.getById(id);
  }
}
