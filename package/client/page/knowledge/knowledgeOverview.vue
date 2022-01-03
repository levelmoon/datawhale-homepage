<template>
  <div class="knowledge-overview">
    <el-alert
      title="为什么会有AI知识体系"
      type="info"
      description="我们做了很久的内容了，希望能串起来给大家一些帮助，还有很多不足的地方，也欢迎大家一起来建设。"
      show-icon
      :closable="false"
    ></el-alert>
    <div>
      <h3>AI知识体系图</h3>
      <div id="container"></div>
    </div>
  </div>
</template>

<script lang="ts">
import { onMounted } from 'vue';
import { initGraph } from './initGraph';

export default {
  name: 'knowledge-overview',
  setup() {
    onMounted(() => {
      initGraph();
    });
  }
};
</script>

<style scoped>
.knowledge-overview {
  padding: 30px;
}
.knowledge-overview-introduction {
  background-color: #f4f4f4;
  border: 1px solid #b3b3b3;
  padding: 0.5rem;
}
#container {
  height: 500px;
}
</style>
