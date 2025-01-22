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

### ☑️待完成

- [ ] 应用导出成 Excel
- [ ] 第三方登录认证（例如：Github登录）
- [ ]  ...欢迎提出有趣的 idea
