<template>
  <div v-if="viewValid">
    <app-navigator></app-navigator>
    <router-view></router-view>
  </div>
  <div v-else>请在宽度大于{{ minWidth }}px的浏览器下浏览该网页，以取得最佳展示效果。</div>
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
.invalid-view {
  font-size: 3vw;
  font-weight: bold;
  line-height: 100vh;
  text-align: center;
  word-break: break-all;
}
</style>
