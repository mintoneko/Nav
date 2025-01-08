package com.dawn.nav.user.service;

import com.dawn.nav.model.dto.CategoryDTO;
import com.dawn.nav.model.po.Category;
import com.dawn.nav.model.vo.CategoryPageVO;
import com.dawn.nav.model.vo.CategoryVO;
import com.dawn.nav.model.vo.PageBeanVO;

import java.util.List;

public interface CategoryService {
  List<CategoryVO> getCategoryTreeList(String username);

  List<Category> findAll(Long userId);

  PageBeanVO<CategoryPageVO> getCategoryPageList(Integer pageNum, Integer pageSize, String searchContent, String orderBy);

  void addCategory(CategoryDTO categoryDTO);

  void updateCategory(CategoryDTO categoryDTO);

  void deleteCategory(Long id);

  List<Category> getCategoryList();
}
