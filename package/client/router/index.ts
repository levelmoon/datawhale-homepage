import { createRouter, createWebHashHistory } from 'vue-router'
import { ROUTER_MAP } from './constant'
import store from '../store'

const homepage = () => import(/* webpackChunkName: 'homepage' */ '../page/homepage/homepage.vue')
const learn = () => import(/* webpackChunkName: 'learn' */ '../page/learn/learn.vue')
const knowledge = () => import(/* webpackChunkName: 'knowledge' */ '../page/knowledge/knowledge.vue')

const routerHashHistory = createWebHashHistory()

const router = createRouter({
  history: routerHashHistory,
  routes: [
    {
      path: ROUTER_MAP[0],
      component: homepage,
    },
    {
      path: ROUTER_MAP[1],
      component: learn,
    },
    {
      path: ROUTER_MAP[2],
      component: knowledge,
    },
  ],
})

router.beforeEach((to, from, next) => {
  for (const key in ROUTER_MAP) {
    if (ROUTER_MAP[key] === to.fullPath) {
      store.commit('setMenuItemIndex', key)
      break
    }
  }
  next()
})

export default router
