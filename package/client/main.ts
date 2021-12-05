import { createApp } from 'vue'
import App from './app.vue'
import store from './store'
import router from './router'
import 'element-plus/dist/index.css'
import elementPlus from 'element-plus'

const app = createApp(App)
app.use(store)
app.use(router)
app.use(elementPlus)
app.mount('#root')
