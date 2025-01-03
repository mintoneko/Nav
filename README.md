# 🏠Nav

多用户导航站，每个人都拥有自己的导航页面，功能强大，样式极简。



## ✏️简介

采用前后端分离构造：

- frontend
- backend

前端负责页面展示，路由处理和采集用户行为。

后端负责创建服务，让前端能够调取API访问数据库信息。



## 🔭功能特性

- 样式简洁，支持自定义网站名称/Logo等信息
- 支持多用户，每个用户都拥有自己的导航页面
- 支持多级分类（导航菜单）
- 支持Excel批量导入导出应用（导航项）
- 输入应用网址，自动爬取Logo/标题/描述信息
- ...



## 🔧开发环境

- **backend**
  - npm
  - vue
  - vite
  - Bootstrap
- **backend**
  - Java
  - SpringBoot
  - SpringSecurit
- **环境**
  - JDK: 17
  - Maven: 3.9.9
  - node：v20.18.1
  - npm: 11.0.0
  - MySQL: 8.0.36
  - Redis: 7.2.6
- **网站部署**
  - caddy：v2.8.4

> 其中mysql，redis，caddy采取docker部署

mysql

```yml
services:
  mysql:
    image: mysql:9.0.1
    restart: always
    container_name: mysql
    environment:
      MYSQL_ROOT_PASSWORD: 123456
      TZ: Asia/Shanghai
    ports:
      - 3306:3306
    volumes:
      - ./datadir:/var/lib/mysql
      - ./config/my.cnf:/etc/mysql/my.cnf
```

redis

```yml
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

redis

```yml
services:
  caddy:
    image: caddy:2.8.4
    restart: unless-stopped
    ports:
      - '80:80'
      - '443:443'
    volumes:
      - ./Caddyfile:/etc/caddy/Caddyfile
      - ./docker-vuejs/dist:/usr/share/caddy
      - ./caddy-data:/data
      - ./caddy-config:/config
```

> test.xxx.xxx



## 📖部署文档



## ⛷️其他事项

### 🎉项目日志

- 24.12.29

  主题讨论完毕，开启项目的编写！
  
- 24.12.30

  - 前端项目和后端项目分离构建
  - 初始化Vue项目
  - 初始化服务器配置，docker compose配置相关服务
    - mysql
    - redis
    - caddy
  - 前端Vue编写
  - 前端项目结构初始化，界面初始化启动 > success
  - stores工具添加，处理token和info
  - utils工具包添加
    - alert.js > 通知框
    - request.js > 实现统一的请求拦截、响应拦截、Token 管理以及错误处理。
  - 测试HelloPage调用compoent > success
  - 添加 404 路由和重定向 > success
  - 添加api模块
  
- 24.12.31

  - 后端项目初始化
    - 添加backend分支
    - 添加部分util工具包
    - 添加部分TEST测试包
    - 数据库建表以及信息初始化

- 25.1.1

  - 修改sql可执行文件，更新README.md
  
- 25.1.2

  - 前端添加主页模块
    - homepage组件
    - 相关路由信息
  - 后端添加model模块
  - 后端添加user和admin登陆接口
  
- 25.1.3

  - 后端添加认证模块authentication
  - 后端完成model层数据库和前端数据映射
  - 添加报错公共处理类

### ☑️待完成

- [ ] 应用导出成 Excel
- [ ] 鼠标右键，将喜欢的应用添加到自己的页面
- [ ] 第三方登录认证（例如：Github）
- [ ] ...欢迎提出有趣的 idea



