<template>
  <div class="container">
    <div v-if="viewValid" class="valid-view">
      <app-navigator></app-navigator>
      <router-view></router-view>
    </div>
    <div v-else class="invalid-view">请在宽度大于{{ minWidth }}px的浏览器下浏览该网页，以取得最佳展示效果。</div>
  </div>
</template>

<script lang="ts">
import appNavigator from './component/appNavigator.vue';
import { onMounted, reactive, toRefs } from 'vue';

const MIN_WIDTH = 750;

export default {
  components: { appNavigator },
  setup() {
    const data = reactive({
      viewValid: true,
      minWidth: MIN_WIDTH
    });

    onMounted(() => {
      window.addEventListener('resize', () => {
        if (document.body.clientWidth < MIN_WIDTH && data.viewValid) {
          data.viewValid = false;
        } else if (document.body.clientWidth >= MIN_WIDTH && !data.viewValid) {
          data.viewValid = true;
        }
      });
    });

    return {
      ...toRefs(data)
    };
  }
};
</script>

<style scoped>
.container {
  width: 100vw;
  height: 100vh;
}
.valid-view {
  min-width: 100vw;
  min-height: 100vh;
}
.invalid-view {
  min-width: 100vw;
  min-height: 100vh;
  font-size: 3vw;
  font-weight: bold;
  line-height: 100vh;
  text-align: center;
  word-break: break-all;
}
</style>
