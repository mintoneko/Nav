<template>
  <TopBar></TopBar>
  <div class="home-container">
    <ContentRootSection></ContentRootSection>
  </div>
</template>
<script>
import HelloWorld from "@/components/HelloWorld.vue";
import TopBar from "@/components/front/TopBar.vue";
import ContentRootSection from "@/components/front/ContentRootSection.vue";
export default {
  components: {
    HelloWorld,
    TopBar,
    ContentRootSection
  },
  data() {
    return {
      username: null, // 定义一个变量存储路由参数 userId
    };
  },
  created() {
    // 在组件创建时获取路由参数id
    this.username = this.$route.params.username;
  }
}
</script>
<style scoped>
.home-container {
  margin: 0 auto;
  padding: 0;
  width: 100vw;
  margin-right: 0px;
}
</style>