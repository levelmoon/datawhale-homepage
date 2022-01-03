<template>
  <div class="knowledge">
    <div class="flex-row-left">
      <div class="knowledge-side-menu">
        <div
          @click="selectedItem(0)"
          class="side-menu side-menu-title"
          :class="[selectedId === 0 ? 'selected-item' : 'side-menu-title']"
        >
          <a>关于AI知识体系</a>
        </div>
        <div
          @click="selectedItem(item.id)"
          v-for="item of knowledge"
          :key="item.id"
          :index="item.id"
          class="side-sub-menu"
          :class="[selectedId === item.id ? 'selected-item' : 'side-sub-menu']"
        >
          <a>{{ item.name }}</a>
        </div>
      </div>
      <div class="knowledge-detail">
        <knowledge-overview v-if="selectedId === 0"></knowledge-overview>
        <knowledge-detail v-if="selectedId !== 0" :content="content"></knowledge-detail>
      </div>
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
.knowledge-side-menu {
  height: calc(100vh - 61px);
  width: 250px;
  overflow: auto;
  /* border-right: 1px solid #e5e7ec; */
  box-shadow: rgba(0, 0, 0, 0.1) 0px 2px 12px 0px;
}
.side-menu {
  display: flex;
  align-items: center;
  font-size: 14px;
  list-style: none;
  white-space: nowrap;
  color: black;
  background-color: white;
}
.side-menu-title {
  height: 56px;
  line-height: 56px;
  padding: 0 20px;
}
.side-sub-menu {
  height: 32px;
  line-height: 32px;
  font-size: 14px;
  padding: 0 40px;
}
.content-title >>> .el-timeline-item__timestamp {
  font-size: 16px;
  font-weight: bold;
  color: #409eff;
}
.selected-item {
  color: white;
  background-color: #409eff;
}
.knowledge-detail {
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>
