<template>
  <div class="knowledge">
    <div class="flex-row-left">
      <el-menu @select="selectMenu" class="menu" default-active="1">
        <el-menu-item v-for="item of knowledge" :key="item.id" :index="item.id" class="menu-item">
          <span>{{ item.name }}</span>
        </el-menu-item>
      </el-menu>
      <el-timeline class="main">
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
    </div>
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
.menu {
  height: calc(100vh - 61px);
  width: 250px;
  overflow: auto;
}
.main {
  padding-top: 24px;
  width: 100%;
  height: calc(100vh - 85px);
  overflow: auto;
}
.content-title >>> .el-timeline-item__timestamp {
  font-size: 16px;
  font-weight: bold;
  color: #409eff;
}
</style>
