package com.down.nav.admin.service.impl;

import com.dawn.nav.admin.mapper.CategoryAdminMapper;
import com.dawn.nav.admin.service.CategoryAdminService;
import com.dawn.nav.exception.ExceptionTool;
import com.dawn.nav.model.po.Category;
import com.dawn.nav.model.vo.CategoryPageVO;
import com.dawn.nav.model.vo.PageBeanVO;
import com.dawn.nav.user.mapper.CategoryMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryAdminServiceImpl implements CategoryAdminService {
    private final CategoryAdminMapper categoryAdminMapper;
    private final CategoryMapper categoryMapper;
    @Override
    public PageBeanVO<CategoryPageVO> getCategoryPageList(Integer pageNum, Integer pageSize, String orderBy, String searchContent) {
        PageBeanVO<CategoryPageVO> pageBeanVO = new PageBeanVO<>();
        PageHelper.startPage(pageNum, pageSize);
        List<CategoryPageVO> categoryPageVOS = categoryAdminMapper.findAllPageVO(orderBy, searchContent);
        Page<CategoryPageVO> page = (Page<CategoryPageVO>) categoryPageVOS;
        pageBeanVO.setTotal(page.getTotal());
        pageBeanVO.setItems(page.getResult());
        return pageBeanVO;
    }

    @Override
    public void deleteCategoryById(Long id) {
        if (id == null){
            ExceptionTool.throwException("id 不能为空！");
        }
        Category category = categoryMapper.getCategoryById(id);
        if (category == null){
            ExceptionTool.throwException("该分类不存在！");
        }
        categoryMapper.deleteById(id);
    }
}