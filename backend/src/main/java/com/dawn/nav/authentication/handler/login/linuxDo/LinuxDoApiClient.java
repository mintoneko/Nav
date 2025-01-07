package com.dawn.nav.authentication.handler.login.linuxDo;

import com.dawn.nav.exception.ExceptionTool;
import com.dawn.nav.util.JSONUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

@Component
public class LinuxDoApiClient {
    private RestTemplate restTemplate = new RestTemplate();

    @Value("${login.LinuxDo.clientId}")
    private String clientId;

    @Value("${login.LinuxDo.clientSecret}")
    private String clientSecret;

    @Value("${login.LinuxDo.redirectUri}")
    private String redirectUri;

    public String getTokenByCode(String code) {
        String tokenEndpoint = "https://connect.linux.do/oauth2/token";
        try {
            // 构建请求体
            StringBuilder params = new StringBuilder();
            params.append("grant_type=").append(URLEncoder.encode("authorization_code", "UTF-8"));
            params.append("&code=").append(URLEncoder.encode(code, StandardCharsets.UTF_8));
            params.append("&redirect_uri=").append(URLEncoder.encode(redirectUri, StandardCharsets.UTF_8));

            // 创建URL和连接
            URL url = new URL(tokenEndpoint);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            // 设置请求头
            String credentials = clientId + ":" + clientSecret;
            String encodedCredentials = Base64.getEncoder().encodeToString(credentials.getBytes("UTF-8"));
            conn.setRequestProperty("Authorization", "Basic " + encodedCredentials);
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            conn.setRequestProperty("Accept", "application/json");

            // 发送请求体
            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = params.toString().getBytes("UTF-8");
                os.write(input, 0, input.length);
            }

            // 读取响应
            int status = conn.getResponseCode();
            InputStream is = (status >= 200 && status < 300) ? conn.getInputStream() : conn.getErrorStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = in.readLine()) != null) {
                response.append(line);
            }
            in.close();

            // 解析响应
            String responseJson = response.toString();
            Map<String, Object> responseMap = JSONUtil.parseToMap(responseJson);
            Object accessToken = responseMap.get("access_token");
            if (accessToken == null) {
                String errorMessage = (String) responseMap.get("message");
                ExceptionTool.throwException("获取LinuxDoToken失败！错误信息：" + errorMessage);
            }
            return accessToken.toString();
        } catch (Exception e) {
            // 处理异常
            throw new RuntimeException("获取LinuxDoToken失败！", e);
        }
    }

    public Map<String, Object> getThirdUserInfo(String token) {
        String url = "https://connect.linux.do/api/user";
        try {
            URL obj = new URL(url);
            HttpURLConnection conn = (HttpURLConnection) obj.openConnection();
            conn.setRequestMethod("GET");

            // 设置Authorization头部
            conn.setRequestProperty("Authorization", "Bearer " + token);
            conn.setRequestProperty("Accept", "application/json");

            int responseCode = conn.getResponseCode();
            InputStream is = (responseCode >= 200 && responseCode < 300) ? conn.getInputStream() : conn.getErrorStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = in.readLine()) != null) {
                response.append(line);
            }
            in.close();

            // 解析响应
            String responseJson = response.toString();
            Map<String, Object> responseMap = JSONUtil.parseToMap(responseJson);

            Object openId = responseMap.get("id");
            if (openId == null) {
                // 可以根据需要抛出异常或返回特定错误信息
                throw new RuntimeException("获取用户信息失败，未找到id字段。");
            }

            HashMap<String, Object> thirdUser = new HashMap<>();
            thirdUser.put("openId", openId);
            thirdUser.put("nickname", responseMap.get("username")); // 使用username字段
            return thirdUser;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("获取LinuxDo用户信息失败！", e);
        }
    }
}
