package com.dawn.nav.admin_bak.mapper;

import com.dawn.nav.model.vo.CategoryPageVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryAdminMapper {
  List<CategoryPageVO> findAllPageVO(String orderBy, String searchContent);
}
