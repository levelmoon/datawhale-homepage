<template>
  <el-timeline class="knowledge-detail">
    <el-timeline-item
      v-for="(item, index) of content"
      :key="index"
      :timestamp="item.name"
      placement="top"
    >
      <div v-for="(ele, index) of item.content" :key="index" class="knowledge-timeline-item">
        <div class="knowledge-timeline-title">{{ ele.title }}</div>
        <el-card class="knowledge-timeline-item-card">
          <div class="flex-row-align-center">
            <img :src="ele.img" class="knowledge-timeline-item-image" />
            <div>
              <div>{{ ele.context }}</div>
              <div class="knowledge-timeline-item-link">
                学习链接：<a :href="ele.url">{{ ele.url }}</a>
              </div>
            </div>
          </div>
        </el-card>
      </div>
    </el-timeline-item>
    <el-timeline-item timestamp="恭喜毕业啦!" placement="top"> </el-timeline-item>
  </el-timeline>
</template>

<script lang="ts">
export default {
  name: 'knowledgeDetail',
  props: {
    content: {
      type: Array,
      default: []
    }
  }
};
</script>

<style scoped>
.knowledge-detail {
  padding: 30px 30px 10px 30px;
}
.knowledge-timeline-item {
  margin: 12px 0 30px 0;
}
.knowledge-timeline-title {
  font-size: 14px;
  font-weight: 500;
  margin-bottom: 12px;
}
.knowledge-timeline-item-card {
  overflow: hidden;
}
.knowledge-timeline-item-image {
  flex-shrink: 0;
  object-fit: cover;
  width: 300px;
  height: 180px;
  margin-right: 20px;
}
.knowledge-timeline-item-link {
  margin-top: 8px;
}
</style>
