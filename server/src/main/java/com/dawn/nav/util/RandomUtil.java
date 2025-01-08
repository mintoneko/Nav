package com.dawn.nav.util;

import java.util.Random;

public class RandomUtil {
  public static String getEmailCode() {
    Random r = new Random();
    StringBuilder code = new StringBuilder();
    for (int i = 0; i < 6; i++) {
      int randomNum = r.nextInt(10);
      code.append(randomNum);
    }
    return code.toString();
  }
}
