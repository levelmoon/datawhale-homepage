<template>
  <div class="navigator">
    <div class="navigator-left">Datawhale</div>
    <el-menu :default-active="$store.state.menuItemIndex" class="navigator-menu" mode="horizontal" @select="handleSelect">
      <el-menu-item class="navigator-menu-item" index="0"> 主页 </el-menu-item>
      <el-menu-item class="navigator-menu-item" index="1"> 学习 </el-menu-item>
      <el-menu-item class="navigator-menu-item" index="2"> 知识体系 </el-menu-item>
    </el-menu>
    <div class="navigator-right">
      <el-popover placement="bottom" :width="200" trigger="hover">
        <template #reference>
          <wechat-logo class="navigator-logo"></wechat-logo>
        </template>
        <div class="navigator-qrcode-popover">
          <div class="navigator-qrcode-popover-title">扫码关注公众号</div>
          <img class="navigator-qrcode-popover-image" src="../asset/qrcode.jpg" />
        </div>
      </el-popover>
      <github-logo class="navigator-logo" @click="goGithub"></github-logo>
    </div>
  </div>
</template>

<script lang="ts">
import { ROUTER_MAP } from '../router/constant';
import { useStore } from 'vuex';
import { useRouter } from 'vue-router';
import githubLogo from '../asset/github.svg';
import wechatLogo from '../asset/wechat.svg';

export default {
  setup() {
    const store = useStore();
    const router = useRouter();

    const handleSelect = (key: string) => {
      store.commit('setMenuItemIndex', key);
      router.push(ROUTER_MAP[key]);
    };

    const goGithub = () => {
      window.open('https://github.com/datawhalechina');
    };
    return { handleSelect, goGithub };
  },
  components: { githubLogo, wechatLogo }
};
</script>

<style scoped>
.navigator {
  display: flex;
  flex-direction: row;
}
.navigator-left {
  width: 265px;
  height: 60px;
  border-bottom: solid 1px #e6e6e6;
  text-align: center;
  font-size: 24px;
  line-height: 60px;
  height: 60px;
  color: #409eff;
}
.navigator-menu {
  width: 100%;
  font-weight: 500;
  --el-menu-bg-color: #fff;
  --el-menu-hover-bg-color: #fff;
}
.navigator-menu-item {
  width: 120px;
}
.navigator-right {
  width: 300px;
  height: 60px;
  border-bottom: solid 1px #e6e6e6;
  text-align: center;
  font-size: 22px;
  line-height: 60px;
  height: 60px;
}
.navigator-logo {
  margin: 18px 24px;
  width: 24px;
  height: 24px;
  cursor: pointer;
  color: var(--el-menu-text-color);
}
.navigator-qrcode-popover {
  width: 200px;
  height: 225px;
  padding: 0;
}
.navigator-qrcode-popover-title {
  width: 200px;
  height: 20px;
  line-height: 20px;
  margin-bottom: 5px;
  text-align: center;
  color: #000;
}
.navigator-qrcode-popover-image {
  width: 200px;
  height: 200px;
}
.el-menu--horizontal .el-menu-item:not(.is-disabled):hover {
  color: var(--el-menu-active-color);
}
</style>
