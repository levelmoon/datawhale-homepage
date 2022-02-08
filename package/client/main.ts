import { createApp } from 'vue';
import App from './app.vue';
import store from './store';
import router from './router';
import elementPlus from 'element-plus';

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

main();
