<template>
  <div class="m-content-display">
    <div class="m-router-view">
      <router-view />
    </div>
  </div>
</template>
<script>
</script>
<style scoped>
html,
body,
#app {
  margin: 0;
  padding: 0;
  height: 100%;
  width: 100%;
  /* 禁止横向滚动 */
  overflow-x: hidden;
  box-sizing: border-box;
}

*,
*::before,
*::after {
  box-sizing: inherit;
}

.alert {
  z-index: 1051 !important;
  /* 确保 z-index 覆盖其他样式 */
}

.m-content-display {
  display: flex;
  flex-direction: column;
  /* 使用视口高度 */
  min-height: 100vh;
  /* 禁止横向滚动 */
  overflow-x: hidden;
}

.m-router-view {
  flex: 1;
}
</style>
