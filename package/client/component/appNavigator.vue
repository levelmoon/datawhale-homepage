<template>
  <div class="navigator">
    <div class="navigator-left">Datawhale</div>
    <el-menu
      :default-active="$store.state.menuItemIndex"
      class="navigator-menu"
      mode="horizontal"
      @select="handleSelect"
    >
      <el-menu-item class="navigator-menu-item" index="0">主页</el-menu-item>
      <el-menu-item class="navigator-menu-item" index="1">学习</el-menu-item>
      <el-menu-item class="navigator-menu-item" index="2"
        >知识体系</el-menu-item
      >
    </el-menu>
    <div class="navigator-right">
      <github-logo
        class="navigator-github-logo"
        @click="goGithub"
      ></github-logo>
    </div>
  </div>
</template>

<script>
import { ROUTER_MAP } from "../router/constant";
import { useStore } from "vuex";
import { useRouter } from "vue-router";
import githubLogo from "../asset/github.svg";

export default {
  setup() {
    const store = useStore();
    const router = useRouter();

    const handleSelect = (key) => {
      store.commit("setMenuItemIndex", key);
      router.push(ROUTER_MAP[key]);
    };

    const goGithub = () => {
      window.open("https://github.com/datawhalechina");
    };
    return { handleSelect, goGithub };
  },
  components: { githubLogo },
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
  font-size: 22px;
  line-height: 60px;
  height: 60px;
  color: #409eff;
}
.navigator-menu {
  width: 100%;
}
.navigator-menu-item {
  width: 120px;
}
.navigator-right {
  width: 200px;
  height: 60px;
  border-bottom: solid 1px #e6e6e6;
  text-align: center;
  font-size: 22px;
  line-height: 60px;
  height: 60px;
  color: #409eff;
}
.navigator-github-logo {
  margin: 10px;
  width: 40px;
  height: 40px;
  cursor: pointer;
}
</style>
