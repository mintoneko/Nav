#  Vue 3 + Vite

该模板可以帮助你开始使用 Vite 开发 Vue 3 项目。模板使用了 Vue 3 的 <script setup> 单文件组件 (SFCs)。想了解更多，请查看 [script setup 文档](https://v3.vuejs.org/api/sfc-script-setup.html#sfc-script-setup)。

关于 Vue 的 IDE 支持，可以在 [Vue 文档的扩展指南](https://vuejs.org/guide/scaling-up/tooling.html#ide-support) 中了解更多信息。



## 结构

### 项目结构

```bash
.
├── README.md                 
├── index.html                # 应用的主 HTML 文件，注入 Vue 实例
├── package-lock.json         
├── package.json              # npm依赖项
├── public                    # 静态资源文件夹，存放不会被打包的文件（如 favicon、静态图片）
├── src                       
│   ├── App.vue               # Vue 应用的根组件，所有页面组件的入口
│   ├── api                   # API 模块
│   ├── assets                # 静态资源
│   ├── components            # 存放通用的 Vue 组件
│   ├── main.js               # Vue 应用的入口文件，初始化应用并挂载到 DOM
│   ├── router                # 路由相关文件夹
│   │   ├── index.js          # 路由配置入口文件，创建routes实例并导出
│   │   └── routes.js         # 自定义路由规则
│   ├── stores                # 状态管理（Pinia）
│   ├── utils                 # 工具函数
│   └── views                 # 页面
│       ├── HelloPage.vue     # 示例页面组件
│       └── Homepage.vue      # 应用的主页组件
└── vite.config.js            # Vite 的配置文件
```

