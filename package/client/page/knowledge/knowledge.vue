<template>
  <div class="knowledge flex-row-left">
    <div class="knowledge-side-menu">
      <div
        @click="selectedItem(0)"
        class="side-menu"
        :class="[selectedId === 0 ? 'selected-item' : 'side-menu-title']"
      >
        关于AI知识体系
      </div>
      <div
        @click="selectedItem(item.id)"
        v-for="item of knowledge"
        :key="item.id"
        :index="item.id"
        class="side-menu"
        :class="[selectedId === item.id ? 'selected-item' : 'side-sub-menu']"
      >
        {{ item.name }}
      </div>
    </div>
    <div class="knowledge-content">
      <knowledge-overview v-if="selectedId === 0"></knowledge-overview>
      <knowledge-detail v-if="selectedId !== 0" :content="content"></knowledge-detail>
    </div>
  </div>
</template>

<script lang="ts">
import { onMounted, reactive, toRefs } from 'vue';
import { http } from '../../service/axios';
import knowledgeDetail from './knowledgeDetail.vue';
import knowledgeOverview from './knowledgeOverview.vue';

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
  },
  components: {
    knowledgeDetail,
    knowledgeOverview
  },
  data() {
    return {
      selectedId: 0
    };
  },
  methods: {
    selectedItem(item) {
      console.log(item);
      this.selectedId = item;
    }
  }
};
</script>

<style scoped>
.knowledge {
  height: calc(100vh - 61px);
}
.knowledge-side-menu {
  height: calc(100vh - 61px);
  overflow: auto;
  width: 200px;
  font-size: 14px;
  border-right: solid 1px #e6e6e6;
  cursor: pointer;
  flex-shrink: 0;
}
.side-menu {
  height: 56px;
  line-height: 56px;
  padding: 0 20px;
  color: var(--el-text-color-primary);
}
.selected-item {
  color: var(--el-color-primary);
}
.knowledge-content {
  width: 100%;
  height: calc(100vh - 61px);
  overflow: auto;
}
</style>
