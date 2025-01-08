<template>
  <TopBar style="opacity: 0.8; color: aliceblue;"></TopBar>
  <div class="login-container">
    <div class="card login-container-card noto-serif-sc-text">
      <div class="card-body">
        <!-- <div style="text-align: center;">
          登录
        </div> -->
        <div class="row login-container-card-type">
          <div @click="changeLoginType(0)" :class="loginType === 0 ? 'col login-type-active' : 'col login-type'">
            密码登录
          </div>
          <div @click="changeLoginType(1)" :class="loginType === 1 ? 'col login-type-active' : 'col login-type'">
            免密登录
          </div>
        </div>

        <form @submit.prevent="handleLoginPassword" v-if="loginType === 0" class="row g-3">
          <div class="col-md-12">
            <label for="validationDefaultUsername" required class="form-label">用户名/邮箱</label>
            <input v-model="loginPasswordData.username" type="text" class="form-control" placeholder="请输入用户名或邮箱"
              id="validationDefaultUsername" aria-describedby="inputGroupPrepend2" required>
          </div>
          <div class="col-md-12">
            <label for="validationDefault03" required class="form-label">密码</label>
            <input v-model="loginPasswordData.password" type="password" class="form-control" placeholder="请输入密码"
              id="validationDefault03" required>
          </div>
          <div class="col-12">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="invalidCheck2">
              <label class="form-check-label" for="invalidCheck2">
                记住我
              </label>
            </div>
          </div>
          <div class="col-12">
            <button class="btn btn-primary col-12" type="submit">登录</button>
          </div>
        </form>

        <form @submit.prevent="handleLoginCode" v-else class="row g-3">
          <div class="col-md-12">
            <label for="validationDefaultUsername" required class="form-label">邮箱</label>
            <input v-model="loginCodeData.email" type="text" class="form-control" placeholder="请输入邮箱"
              id="validationDefaultUsername" aria-describedby="inputGroupPrepend2" required>
          </div>
          <div class="col-md-12">
            <label for="validationDefault03" required class="form-label">验证码</label>
            <div class="input-group" style="margin: 0px;">
              <input v-model="loginCodeData.code" type="text" class="form-control" placeholder="请输入验证码"
                id="validationCode" required>
              <span :class="['input-group-text', { disabled: isSending }]" @click="sendCode" style="cursor: pointer;">
                {{ sendButtonText }}
              </span>
            </div>
          </div>
          <div class="col-12">
            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="invalidCheck2">
              <label class="form-check-label" for="invalidCheck2">
                记住我
              </label>
            </div>
          </div>
          <div class="col-12">
            <button class="btn btn-primary col-12" type="submit">登录</button>
          </div>
        </form>
        <div class="row">
          <span class="col text-start">
            <router-link to="/register" style="text-decoration: none;">
              没有账号，去注册！
            </router-link>
          </span>
          <span class="col text-end">
            <router-link to="/reset-pwd" style="text-decoration: none;">
              忘记密码？
            </router-link>
          </span>
        </div>

      </div>
    </div>
  </div>
</template>

<script>
import TopBar from "@/components/front/TopBar.vue";
import userApi from "@/api/user";
import alertUtil from "@/utils/alert";
import { ref, computed, onMounted } from "vue";
import { useRouter } from "vue-router";
import { useTokenStore } from "@/stores/token";
import { useUserInfoStore } from "@/stores/userInfo";
import settingApi from "@/api/setting";
export default {
  components: {
    TopBar,
  },
  setup() {
    const router = useRouter()
    const loginType = ref(0);
    const loginPasswordData = ref({
      username: '',
      password: '',
    });
    const loginCodeData = ref({
      email: '',
      code: '',
    });
    const isSending = ref(false);
    const countdown = ref(60);
    const timer = ref(null);
    const tokenStore = useTokenStore(); // 获取 store 实例
    const sendButtonText = computed(() => {
      return isSending.value ? `${countdown.value}s 后重试` : '发送';
    });
    const validateEmail = (email) => {
      const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      return re.test(email);
    };
    const sendCode = async () => {
      if (isSending.value) return;
      if (!validateEmail(loginCodeData.value.email)) {
        alertUtil.message('请输入有效的邮箱地址', 'danger');
        return;
      }

      isSending.value = true;

      try {
        // const res = await sendCodeService(registerData.value.email, 1);
        const res = await userApi.sendCode(loginCodeData.value.email, 2);
        console.log(res);
        alertUtil.message('验证码已发送', 'success');
        // 开始倒计时
        timer.value = setInterval(() => {
          if (countdown.value > 0) {
            countdown.value--;
          } else {
            clearInterval(timer.value);
            isSending.value = false;
            countdown.value = 60;
          }
        }, 1000);
      } catch (error) {
        alertUtil.message('发送验证码失败，请稍后再试', 'danger');
        isSending.value = false;
      }
    };
    const getNowUser = async () => {
      const res = await userApi.getCurrentUser();
      return res.data;
    };
    const handleLoginCode = async () => {
      // 处理登录逻辑
      if (!validateEmail(loginCodeData.value.email)) {
        alertUtil.message('请输入有效的邮箱地址', 'danger');
        return;
      }

      // 发送登录请求
      const res = await userApi.loginCode(loginCodeData.value);
      if (res.code == 0) {
        alertUtil.message('登录成功！');
        tokenStore.setToken(res.data); // res.data 是 token , refreshToken值
        const nowUser = await getNowUser()
        const userInfoStore = useUserInfoStore()
        userInfoStore.setInfo(nowUser)
        router.push("/")
      }
    };

    const handleLoginPassword = async () => {
      // 发送登录请求
      const res = await userApi.loginPassword(loginPasswordData.value);
      console.log(res.data);
      if (res.code == 0) {
        alertUtil.message('登录成功！', 'success');
        tokenStore.setToken(res.data); // res.data 是 token , refreshToken值
        const nowUser = await getNowUser()
        const userInfoStore = useUserInfoStore()
        userInfoStore.setInfo(nowUser)
        router.push("/")
      }
    };
    const changeLoginType = (val) => {
      loginType.value = val;
    };

    // 生成随机字符串
    const generateRandomString = (length) => {
      const chars =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
      let result = "";
      for (let i = 0; i < length; i++) {
        result += chars.charAt(Math.floor(Math.random() * chars.length));
      }
      return result;
    };
    return {
      loginType,
      changeLoginType,
      loginPasswordData,
      loginCodeData,
      isSending,
      countdown,
      timer,
      sendButtonText,
      sendCode,
      handleLoginCode,
      handleLoginPassword,
    };
  },
};
</script>

<style scoped>
.login-type {
  cursor: pointer;
  text-align: center;
  font-size: 20px;
  font-weight: 900;
}

.login-type-active {
  cursor: pointer;
  text-align: center;
  font-size: 20px;
  font-weight: 900;
  color: #de7622;
}

.login-container {
  min-height: 100vh;
  /* 设置容器高度为视口高度，确保图片铺满整个屏幕 */
  /* 使用 Flexbox 来居中内容 */
  display: flex;
  /* 垂直居中 */
  align-items: center;
  /* 水平居中 */
  justify-content: center;
}

.login-container-card {
  border: #000000 solid 1px;
  opacity: 0.8;
}

.noto-serif-sc-text {
  font-family: "Noto Serif SC", serif;
  font-optical-sizing: auto;
  font-weight: 700;
  font-style: normal;
}

/* 自定义媒体查询以调整卡片宽度 */
@media (min-width: 576px) {

  /* 小型设备（平板手机） */
  .login-container-card {
    max-width: 450px;
  }
}

@media (min-width: 768px) {

  /* 中型设备（平板） */
  .login-container-card {
    max-width: 460px;
  }
}

@media (min-width: 992px) {

  /* 大型设备（桌面） */
  .login-container-card {
    max-width: 480px;
  }
}

@media (min-width: 1200px) {

  /* 超大型设备（大型桌面） */
  .login-container-card {
    max-width: 500px;
  }
}

/* 按钮全宽 */
.btn-primary.w-100 {
  padding: 10px;
  font-size: 18px;
}

/* 输入框样式调整（可选） */
.form-control {
  border-radius: 5px;
}

.line {
  display: table;
  width: 100%;
  white-space: nowrap;
  border-spacing: .2rem 0;
  color: #ccc;
}

.line:before,
.line:after {
  display: table-cell;
  content: '';
  width: 50%;
  background: -webkit-linear-gradient(#eee, #eee) repeat-x left center;
  background: linear-gradient(#eee, #eee) repeat-x left center;
  background-size: 0.1rem 0.1rem;
}
</style>
