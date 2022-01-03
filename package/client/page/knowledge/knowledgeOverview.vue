<template>
  <div class="main-wrapper">
    <div>
      <h3>为什么会有AI知识体系</h3>
      <div class="top-content">
        我们做了很久的内容了，希望能串起来给大家一些帮助，还有很多不足的地方，也欢迎大家一起来建设。
      </div>
    </div>
    <div>
      <h3>AI知识体系图</h3>
      <div id="container"></div>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, reactive, toRefs, SetupContext } from 'vue';
export default defineComponent({
  name: 'Overview',
  mounted() {
  }
});
</script>
<style scoped>
.main-wrapper {
  max-width: 700px;
}
.top-content {
  background-color: #f4f4f4;
  border: 1px solid #b3b3b3;
  padding: 0.5rem;
}
</style>
