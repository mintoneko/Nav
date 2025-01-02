// 简化和统一在应用程序中抛出自定义异常 BaseException 的过程
package com.down.nav.exception;

import org.springframework.http.HttpStatus;

public class ExceptionTool {
  private static final HttpStatus defaultHttpStatus = HttpStatus.BAD_REQUEST;

  public static void throwException(String message) {
    BaseException baseException = new BaseException(message, defaultHttpStatus);
    baseException.setCode(1);
    throw baseException;
  }

  public static void throwException(String message, Integer code) {
    BaseException baseException = new BaseException(message, defaultHttpStatus);
    baseException.setCode(code);
    throw baseException;
  }

  public static void throwException(String message, HttpStatus httpStatus, Integer errorCode) {
    BaseException baseException = new BaseException(message, httpStatus);
    baseException.setCode(errorCode);
    throw baseException;
  }
}