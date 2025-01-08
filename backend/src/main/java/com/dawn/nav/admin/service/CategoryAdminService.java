package com.dawn.nav.admin.service;

import com.dawn.nav.model.vo.CategoryPageVO;
import com.dawn.nav.model.vo.PageBeanVO;

public interface CategoryAdminService {
  PageBeanVO<CategoryPageVO> getCategoryPageList(Integer pageNum, Integer pageSize, String orderBy, String searchContent);

  void deleteCategoryById(Long id);
}
