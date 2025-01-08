## 使用文档

> 请务必仔细阅读文档，然后才能顺利部署。

### 1. 环境

- JDK: 17
- Maven: 3.9.9
- node：v20.18.1
- npm: 11.0.0
- MySQL: 9.0.1
- Redis: 7.2.6

> 其中MySQL和Redis采用docker compose部署。
>
> 请务必确保你的版本大于上述版本，以免给您带来困扰。

### 2.部署

mysql

```yml
services:
  mysql:
    image: mysql:9.0.1
    restart: always
    container_name: mysql
    environment:
      MYSQL_ROOT_PASSWORD: mobaisilent
      TZ: Asia/Shanghai
    ports:
      - 127.0.0.1:3306:3306
    volumes:
      - ./datadir:/var/lib/mysql
      - ./config/my.cnf:/etc/mysql/my.cnf
```

> PASSWORD改为你自己想要的密码
>
> 端口不对外开放

redis

```yaml
services:
  redis:
    image: redis:7.2.6
    container_name: redis
    restart: always
    ports:
      - '6379:6379'
    volumes:
      - ./data:/data
      - ./redis.conf:/usr/local/etc/redis/redis.conf
      - ./logs:/logs
    command: redis-server /usr/local/etc/redis/redis.conf
```

nginx proxy manager

```yaml
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      - '80:80' # Public HTTP Port
      - '443:443' # Public HTTPS Port
      - '81:81' # Admin Web Port

    environment:
     DISABLE_IPV6: 'true'

    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
```



### 3.打包

确保上述环境配置成功之后。

> 务必先执行SQL在开启后端，否则会报错。

#### 执行SQL

执行database中的sql文件，建议使用sql连接工具。或者进入docker容器内部执行sql指令

```bash
docker exec -it mysql mysql -uroot -pmobaisilent
```

#### 前端打包

```
cd web
npm install
npm run build
```

构建完成后，将生成的 `dist` 文件夹用于部署。

#### 后端打包

在打包前，需要修改application.yml application-prod.yml/application-dev.yml中的配置。包括数据库信息、邮件、LinuxDo/GitHub OAuth2配置参数、管理员邮箱（使用这些邮箱注册后直接是管理员角色）

```
cdserver
mvn clean package
```

打包完成后，在 `target` 目录中会生成一个 `*.jar` 文件，用于后端部署。

```java
java -jar YourFileName.jar
```

### 4.反代配置

```nginx
location / {
		try_files  $uri $uri/ /index.html;
}

location /api {
    rewrite ^/api/(.*)$ /$1 break;
    proxy_pass http://localhost:8080;
}
```

> 使用Nginx Proxy Manager或者Caddy，这里不展开，不了解的建议自行学习

### 5.后台运行

建议使用screen。

- 启动一个新的 screen 会话：

```bash
screen -S server
```

- 在会话中运行你的命令：

```java
java -jar server-0.0.1-SNAPSHOT.jar
```

按 Ctrl+A，然后按 D 将会话断开（不终止运行）。

断开 SSH 后，项目仍然运行。

- 重新连接到会话：

```bash
screen -r server
```

