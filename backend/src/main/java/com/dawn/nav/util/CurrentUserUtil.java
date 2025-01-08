package com.dawn.nav.util;

import com.dawn.nav.model.dto.UserLoginDTO;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

public class CurrentUserUtil {
  /**
   * 获取当前认证的用户信息
   *
   * @return 当前用户的 UserPrincipal 对象，若未认证则返回 null
   */
  public static UserLoginDTO getCurrentUser() {
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    if (authentication != null && authentication.isAuthenticated()
            && !(authentication.getPrincipal() instanceof String)) { // 避免匿名用户
      Object principal = authentication.getPrincipal();
      if (principal instanceof UserLoginDTO) {
        return (UserLoginDTO) principal;
      }
    }
    return null;
  }
}
