<template>
  <div class="knowledge">
    <el-container class="container">
      <el-aside class="side" width="200px">
        <el-menu
          @select="selectMenu"
          active-text-color="#409EFF"
          background-color="#f6f6f6"
          class="menu"
          default-active="1"
          text-color="#000000"
        >
          <el-menu-item v-for="item of knowledge" :key="item.id" :index="item.id" class="menu-item">
            <span>{{ item.name }}</span>
          </el-menu-item>
        </el-menu></el-aside
      >
      <el-main class="main">
        <el-timeline>
          <el-timeline-item
            v-for="(item, index) of content"
            :key="index"
            :timestamp="item.name"
            placement="top"
            class="content-title"
          >
            <section
              v-for="(ele, index) of item.content"
              :key="index"
              style="margin: 0.5rem; max-width: 50rem"
            >
              <h4>{{ ele.title }}</h4>
              <el-card>
                {{ ele.context }}
              </el-card>
            </section>
          </el-timeline-item>
        </el-timeline>
      </el-main>
    </el-container>
  </div>
</template>

<script lang="ts">
import { onMounted, reactive, toRefs } from 'vue';
import { http } from '../../service/axios';
export default {
  setup() {
    const data = reactive({
      knowledge: [],
      content: []
    });

    const selectMenu = (index: string) => {
      setContent(index);
    };

    const setContent = (id: string) => {
      let ele = data.knowledge.find((x) => x.id === id);
      data.content = ele ? ele.content : [];
    };

    onMounted(async () => {
      const res = await http.get('/api/knowledge');
      data.knowledge = res.data.data.map((item) => {
        return {
          id: item.id.toString(),
          name: item.name,
          content: JSON.parse(item.content)
        };
      });
      setContent('1');
    });

    return {
      ...toRefs(data),
      selectMenu
    };
  }
};
</script>

<style scoped>
.knowledge {
  width: 100vw;
  height: 100vh;
}
.container {
  height: 100%;
}
.side {
  background-color: #f6f6f6;
}
.main {
}

.menu-item {
  justify-content: center;
  font-size: 16px;
  font-weight: 400;
}
.content-title >>> .el-timeline-item__timestamp {
  font-size: 16px;
  font-weight: bold;
  color: #409eff;
}
</style>
