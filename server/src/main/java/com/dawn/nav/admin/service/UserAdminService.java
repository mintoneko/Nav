package com.dawn.nav.admin.service;

import com.dawn.nav.model.vo.PageBeanVO;
import com.dawn.nav.model.vo.UserVO;

public interface UserAdminService {
    PageBeanVO<UserVO> getUserPageList(Integer pageNum, Integer pageSize, String orderBy, String searchContent);

    void delUser(Long id);

    void updateRole(Long userId, Integer role);
}
