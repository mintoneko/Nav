// import { useTokenStore } from '@/stores/token.js'
const routes = [
  {
    path: '/hello',
    name: 'hello',
    title: '你好',
    component: () => import('@/views/HelloPage.vue'),
  },
  {
    path: '/',
    name: 'index',
    title: '首页',
    component: () => import('@/views/HomePage.vue'),
  },
  {
    path: '/login',
    name: 'login',
    title: '登录',
    component: () => import('@/views/login/LoginPage.vue'),
  },
  {
    path: '/register',
    name: 'register',
    title: '注册',
    component: () => import('@/views/login/RegisterPage.vue'),
  },
  {
    path: '/reset-pwd',
    name: 'reset-pwd',
    title: '重置密码',
    component: () => import('@/views/login/ResetPwdPage.vue'),
  },
  {
    path: '/manage',
    name: 'manage',
    title: '管理',
    component: () => import('@/views/manage/BasePage.vue'),
    children: [
      {
        path: 'index',
        name: 'manage-index',
        title: '首页',
        component: () => import('@/views/manage/IndexPage.vue'),
      },
      {
        path: 'category',
        name: 'manage-category',
        title: '类别',
        component: () => import('@/views/manage/CategoryPage.vue'),
      },
      {
        path: 'app',
        name: 'admin-app',
        title: '应用',
        component: () => import('@/views/manage/AppPage.vue'),
      },
      {
        path: 'my',
        name: 'manage-my',
        title: '我的',
        component: () => import('@/views/manage/MyPage.vue'),
      },
    ],
  },
  {
    path: '/404',
    name: '404page',
    component: () => import('@/views/404/IndexPage.vue'),
  },
  // 未知路由重定向
  {
    path: '/:pathMatch(.*)',
    redirect: '/404',
    hidden: true
  }
]
export default routes