package com.dawn.nav;

import org.junit.jupiter.api.Test;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.SecureRandom;
import java.util.Base64;

//@SpringBootTest
public class GenSecretKeyTest {

    @Test
    public void genSecretKey() throws Exception {
        // 自定义随机密码, 请修改这里
        String password = "helloworld";

        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA");
        SecureRandom secureRandom = new SecureRandom(password.getBytes());
        keyPairGenerator.initialize(2048, secureRandom);
        KeyPair keyPair = keyPairGenerator.genKeyPair();
        // 获取公钥和私钥的字节数组
        byte[] publicKeyBytes = keyPair.getPublic().getEncoded();
        byte[] privateKeyBytes = keyPair.getPrivate().getEncoded();

        // 将字节数组编码为Base64字符串
        String publicKeyBase64 = Base64.getEncoder().encodeToString(publicKeyBytes);
        String privateKeyBase64 = Base64.getEncoder().encodeToString(privateKeyBytes);

        // 构建PEM格式字符串
        String publicKeyPem = "-----BEGIN PUBLIC KEY-----\n" +
                insertLineBreaks(publicKeyBase64, 64) +
                "\n-----END PUBLIC KEY-----\n";

        String privateKeyPem = "-----BEGIN PRIVATE KEY-----\n" +
                insertLineBreaks(privateKeyBase64, 64) +
                "\n-----END PRIVATE KEY-----\n";

        // 定义文件路径
        Path publicKeyPath = Paths.get("./pub.pem");
        Path privateKeyPath = Paths.get("./pri.pem");

        try {
            // 将PEM格式的密钥写入文件
            Files.write(publicKeyPath, publicKeyPem.getBytes());
            Files.write(privateKeyPath, privateKeyPem.getBytes());
            System.out.println("PEM格式的密钥生成并保存成功！");

            // 测试完成后删除文件
        } finally {
            boolean isPublicKeyDeleted = Files.deleteIfExists(publicKeyPath);
            boolean isPrivateKeyDeleted = Files.deleteIfExists(privateKeyPath);

            if (isPublicKeyDeleted && isPrivateKeyDeleted) {
                System.out.println("测试完成，密钥文件已删除。");
            } else {
                System.out.println("文件删除失败，请检查文件路径！");
            }
        }
    }

    /**
     * 将长字符串每隔指定长度插入换行符，提高PEM文件的可读性
     *
     * @param input  输入字符串
     * @param length 每行长度
     * @return 带有换行符的字符串
     */
    private String insertLineBreaks(String input, int length) {
        StringBuilder sb = new StringBuilder();
        int index = 0;
        while (index < input.length()) {
            sb.append(input, index, Math.min(index + length, input.length()));
            sb.append("\n");
            index += length;
        }
        return sb.toString().trim();
    }
}