import { createApp } from 'vue';
import App from './app.vue';
import store from './store';
import router from './router';
import elementPlus from 'element-plus';
import { http } from './service/axios';

import './style/common.css';
import './style/markdown.css';
import 'element-plus/dist/index.css';
import 'markdown-it-highlight/dist/index.css';
import { initTracker } from './util/tracker';

const main = async () => {
  const app = createApp(App);
  app.use(store);
  app.use(router);
  app.use(elementPlus);
  app.mount('#root');
  await initTracker();
};

let handle = null;
const setPolling = () => {
  handle = setInterval(setUserAction, 20000);
};

const setUserAction = async () => {
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
  let res = await http.post('/api/actions', data);
  console.log('res', res);
  window.tracker.logList = [];
  handle = null;
};

main();
if (!handle) {
  setPolling();
}
