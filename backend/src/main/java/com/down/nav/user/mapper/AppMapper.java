package com.down.nav.user.mapper;

import com.dawn.nav.model.po.App;
import com.dawn.nav.model.vo.AppVO;
import com.dawn.nav.model.vo.AppXlsxVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AppMapper {
    void addApp(App app);

    App getAppById(Long id);

    void deleteApp(Long id);

    void updateApp(App app);

    List<AppVO> getAppVOsByUserId(Long userId, Integer status, Long categoryId);

    List<AppVO> getAppVOsPageNowUser(Long userId, Integer status, Long categoryId, String searchContent);

    List<AppVO> getHotAppVOs(Long userId);

    List<AppVO> searchAppVOs(String searchContent, Long userId);

    List<AppXlsxVO> downLoadAppXlsx(Long userId);
}