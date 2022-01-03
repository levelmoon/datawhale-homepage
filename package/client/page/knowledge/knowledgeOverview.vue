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
import rawData from '../../util/g6';
import G6 from '@antv/g6';
const { Util } = G6;
const colorArr = [
  '#5B8FF9',
  '#5AD8A6',
  '#5D7092',
  '#F6BD16',
  '#6F5EF9',
  '#6DC8EC',
  '#D3EEF9',
  '#DECFEA',
  '#FFE0C7',
  '#1E9493',
  '#BBDEDE',
  '#FF99C3',
  '#FFE0ED',
  '#CDDDFD',
  '#CDF3E4',
  '#CED4DE',
  '#FCEBB9',
  '#D3CEFD',
  '#945FB9',
  '#FF9845'
];
export default defineComponent({
  name: 'Overview',
  methods: {
    initData() {}
  },
  mounted() {
    this.initData();
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
