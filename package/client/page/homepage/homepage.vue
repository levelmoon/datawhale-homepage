<template>
  <div class="homepage">
    <div class="homepage-banner">
      <el-carousel trigger="click" height="400px" arrow="never">
        <el-carousel-item v-for="(item, index) in banner" :key="`carousel-item-${index}`">
          <div class="homepage-banner-item" :style="`background-image: url('${item.url}')`">
            <div class="homepage-banner-text">{{ item.description }}</div>
          </div>
        </el-carousel-item>
      </el-carousel>
    </div>
    <div class="homepage-content flex-row-space-between">
      <el-card class="learn-card">
        <template #header>
          <div class="card-header flex-row-space-between">
            <div>热门学习</div>
            <el-button class="card-header-button" type="text">查看更多</el-button>
          </div>
        </template>
        <div v-for="(item, index) in learn" :key="`learn-${index}`">
          <div class="learn-item flex-row-left">
            <img class="learn-image" :src="item.imageUrl" />
            <div class="learn-detail">
              <div class="learn-detail-name">{{ item.name }}</div>
              <div class="learn-detail-description">{{ item.description }}</div>
              <div class="learn-detail-tag-group flex-row-left">
                <el-tag class="learn-detail-tag" v-for="(tag, index) in item.tagList" :key="`learn-tag-${index}`" type="info">{{
                  tag.tagName
                }}</el-tag>
              </div>
            </div>
          </div>
          <el-divider></el-divider>
        </div>
      </el-card>
      <el-card class="activity-card">
        <template #header>
          <div class="card-header">参加活动</div>
        </template>
        <div v-for="(item, index) in activity" :key="`activity-${index}`">
          <div class="activity-item">
            <el-button type="text">{{ item.name }}</el-button>
            <div class="activity-end-time">{{ item.endTime }} 截止报名</div>
          </div>
          <el-divider></el-divider>
        </div>
      </el-card>
    </div>
  </div>
</template>

<script lang="ts">
import { onMounted, reactive, toRefs } from 'vue';
import { http } from '../../service/axios';

export default {
  setup() {
    const data = reactive({
      activity: [],
      banner: [],
      learn: []
    });
    const testFunction = () => {
      window.alert('hello world');
    };

    onMounted(async () => {
      const res = await http.get('/api/homepage');
      const { activity, banner, learn } = res.data.data;
      data.activity = activity;
      data.banner = banner;
      data.learn = learn;
    });

    return {
      ...toRefs(data),
      testFunction
    };
  }
};
</script>

<style scoped>
.homepage {
  padding: 30px 10vw;
  text-align: left;
}
.homepage-banner {
  width: 100%;
  height: 400px;
}
.homepage-banner-item {
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
}
.homepage-banner-text {
  font-size: 40px;
  padding: 300px 70px 0 70px;
  color: #fff;
}
.homepage-content {
  margin-top: 30px;
}
.card-header {
  height: 40px;
  line-height: 40px;
  font-size: 16px;
  font-weight: 500;
}
.learn-card {
  width: 100%;
  height: 100%;
  margin-right: 30px;
}
.learn-item {
  padding: 0 24px;
  height: 120px;
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
  margin-top: 14px;
  font-size: 14px;
  height: 20px;
  line-height: 20px;
}
.learn-detail-tag-group {
  width: 100%;
  margin-top: 29px;
  height: 32px;
}
.learn-detail-tag {
  margin-right: 8px;
}
.activity-card {
  width: 400px;
  height: 100%;
  flex-shrink: 0;
}
.activity-item {
  padding: 0 24px;
  height: 60px;
}
.activity-end-time {
  font-size: 12px;
  color: #99a9bf;
}
</style>
