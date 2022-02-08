<template>
  <div v-if="viewValid">
    <app-navigator></app-navigator>
    <div class="router-view">
      <router-view></router-view>
    </div>
  </div>
  <div v-else class="invalid-view">
    请在宽度大于{{ minWidth }}px的浏览器下浏览该网页，以取得最佳展示效果。
  </div>
</template>

<script lang="ts">
import appNavigator from './component/appNavigator.vue';
import { onMounted, reactive, toRefs, ref } from 'vue';
import { http } from './service/axios';
import { MIN_DISPLAY_WIDTH } from './constant';

export default {
  components: { appNavigator },
  setup() {
    const data = reactive({
      viewValid: true,
      minWidth: MIN_DISPLAY_WIDTH
    });
    let handle = null;
    const setPolling = () => {
      handle = setInterval(setUserAction, 20000);
    };

    const getActions = () => {
      console.log('window', window.tracker);
      console.log('handle', handle);
    };

    const clearTimerTask = () => {
      clearInterval(handle);
      handle = null;
    };

    const setUserAction = async () => {
      getActions();
      let urls = [];
      if (!window.tracker?.logList || !window.tracker?.sessionId) return;
      let array = window.tracker.logList;
      array.map((x) => {
        urls.push(x.url);
      });
      let data = {
        sessionId: window.tracker.sessionId,
        urls: urls,
        actionTime: new Date()
      };
      console.log('data', data);
      let res = await http.post('/api/actions', data);
      console.log('存入成功', res);
      window.tracker.logList = [];
      handle = null;
    };

    onMounted(() => {
      window.addEventListener('resize', () => {
        if (document.body.clientWidth < MIN_DISPLAY_WIDTH && data.viewValid) {
          data.viewValid = false;
        } else if (document.body.clientWidth >= MIN_DISPLAY_WIDTH && !data.viewValid) {
          data.viewValid = true;
        }
      });
      window.addEventListener('beforeunload', () => {
        alert('哈哈哈哈');
      });
      // setUserAction();
      if (!handle) {
        // setPolling();
      }
    });

    return {
      ...toRefs(data),
      setUserAction
    };
  }
};
</script>

<style scoped>
.router-view {
  width: 100%;
  height: calc(100vh - 61px);
  overflow: auto;
}
.invalid-view {
  font-size: 3vw;
  font-weight: bold;
  line-height: 100vh;
  text-align: center;
  word-break: break-all;
}
</style>
