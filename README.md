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

- **web**
  - npm
  - vue
  - vite
  - ...
- **backend**
  - Java
  - SpringBoot
  - SpringSecurit
  - ...

> 其中mysql，redis采取docker部署

## 📖部署文档

- [示范网站](https://nav.nekos.news)
- [接部署文档](docs/README.md)

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
    - nginx proxy manager
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
  - 其他接口的编写
  - 认证模块

- 25.1.3

  - 后端添加认证模块authentication
  - 后端完成model层数据库和前端数据映射
  - 添加报错公共处理类

- 中途期末考备考

- 25.1.6

  - 数据库完善和修改
  - 前端样式的调整

- 25.1.7

  - 修复一些bug，移除部分不需要的东西

- 25.1.8

  - 期末考试

- 25.1.9

  - README文档的编写
  - PPT的编写
  - 修复部分bug

### ☑️待完成

- [ ] 应用导出成 Excel
- [ ] 第三方登录认证（例如：Github登录）
- [ ]  ...欢迎提出有趣的 idea
