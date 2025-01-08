<template>
  <TopBar></TopBar>
  <div class="home-container">
    <ContentRootSection></ContentRootSection>
  </div>
</template>
<script>
import HelloWorld from "@/components/HelloWorld.vue";
import TopBar from "@/components/front/TopBar.vue";
import ContentRootSection from "@/components/front/ContentUserSection.vue";
export default {
  components: {
    HelloWorld,
    TopBar,
    ContentRootSection
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