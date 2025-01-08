package com.dawn.nav.admin_bak.service;

import com.dawn.nav.model.dto.MenuDTO;
import com.dawn.nav.model.po.Menu;

import java.util.List;

public interface MenuService {
  void addMenu(MenuDTO menuDTO);

  void delMenu(Integer id);

  void updateMenu(MenuDTO menuDTO);

  List<Menu> listMenu(Integer type);
}
