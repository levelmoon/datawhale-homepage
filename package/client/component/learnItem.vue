<template>
  <div class="learn-item flex-row-left">
    <img class="learn-image" :src="imageUrl" />
    <div class="learn-detail">
      <div class="learn-detail-name">{{ name }}</div>
      <div class="learn-detail-description">{{ description }}</div>
      <div class="learn-detail-tag-group flex-row-left">
        <el-tag
          class="learn-detail-tag"
          v-for="(tag, index) in tagList"
          :key="`learn-tag-${index}`"
          type="info"
          >{{ tag.tagName }}</el-tag
        >
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { reactive, toRefs } from 'vue';

interface ILearnItemProps {
  imageUrl: string;
  name: string;
  description: string;
  tagList: { tagName: string }[];
}

export default {
  props: ['imageUrl', 'name', 'description', 'tagList'],
  setup(props: ILearnItemProps) {
    const data = reactive({
      imageUrl: props.imageUrl,
      name: props.name,
      description: props.description,
      tagList: props.tagList
    });

    return {
      ...toRefs(data)
    };
  }
};
</script>

<style scoped>
.learn-item {
  padding: 0 24px;
  height: 120px;
  cursor: pointer;
}
.learn-image {
  width: 200px;
  height: 120px;
  object-fit: cover;
  margin-right: 30px;
}
.learn-detail {
  width: 100%;
  height: 120px;
}
.learn-detail-name {
  font-size: 18px;
  height: 25px;
  line-height: 25px;
}
.learn-detail-description {
  margin-top: 10px;
  font-size: 14px;
  height: 40px;
  line-height: 20px;
}
.learn-detail-tag-group {
  width: 100%;
  margin-top: 13px;
  height: 32px;
}
.learn-detail-tag {
  margin-right: 8px;
}
</style>
