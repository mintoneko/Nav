package com.dawn.nav.admin.controller;

import com.dawn.nav.admin.service.CategoryAdminService;
import com.dawn.nav.model.po.Result;
import com.dawn.nav.model.vo.CategoryPageVO;
import com.dawn.nav.model.vo.PageBeanVO;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/admin/category")
public class CategoryAdminController {
    private final CategoryAdminService categoryAdminService;
    @GetMapping
    public Result<PageBeanVO<CategoryPageVO>> getCategoryPageList(
            @RequestParam Integer pageNum,
            @RequestParam Integer pageSize,
            @RequestParam(required = false) String orderBy,
            @RequestParam(required = false) String searchContent
    ) {
        PageBeanVO<CategoryPageVO> categoryPageList = categoryAdminService.getCategoryPageList(pageNum, pageSize, orderBy, searchContent);
        return Result.success(categoryPageList);
    }

    @DeleteMapping
    public Result deleteCategory(@RequestParam Long id) {
        categoryAdminService.deleteCategoryById(id);
        return Result.success();
    }
}
