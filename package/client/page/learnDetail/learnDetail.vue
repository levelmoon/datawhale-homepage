<template>
  <div class="learn-detail flex-row-left">
    <el-menu :default-active="currentMenuIndex" class="learn-detail-menu">
      <el-menu-item
        v-for="(item, index) in chapterList"
        :index="`chapter-${index}`"
        :key="`learn-menu-${index}`"
        @click="handleMenuItemClick(item.chapterId, index)"
      >
        <div>{{ item.title }}</div>
      </el-menu-item>
      <el-menu-item
        v-if="videoList !== undefined && videoList.length > 0"
        key="learn-menu-video"
        index="chapter-video"
        @click="handleVideoItemClick"
      >
        <div>相关视频</div>
      </el-menu-item>
    </el-menu>
    <div v-if="!showVideo" class="learn-content">{{ content }}</div>
    <div v-if="showVideo" class="learn-video flex-row-left">
      <el-card
        class="learn-video-card"
        v-for="(item, index) in videoList"
        :key="`learn-video-item-${index}`"
        :body-style="{ padding: '0px', width: '300px', height: '260px' }"
        @click="jumpToUrl(item.videoUrl)"
      >
        <img
          class="learn-video-card-image"
          :src="item.imageUrl"
        />
        <div class="learn-video-card-text">{{ item.title }}</div>
      </el-card>
    </div>
  </div>
</template>

<script lang="ts">
import { onMounted, reactive, toRefs } from 'vue';
import { useRouter } from 'vue-router';
import { http } from '../../service/axios';

export default {
  setup() {
    const router = useRouter();

    const data = reactive({
      name: '',
      imageUrl: '',
      chapterList: [],
      currentMenuIndex: 'chapter-0',
      currentChapterId: -1,
      content: '',
      videoList: [],
      showVideo: false
    });

    const handleMenuItemClick = async (chapterId: number, index: number) => {
      const learnId = router.currentRoute.value.params.learnId;
      const learnDetail = await http.get('/api/learn/detail', { params: { learnId, chapterId } });
      data.showVideo = false;
      data.currentMenuIndex = `chapter-${index}`;
      data.currentChapterId = chapterId;
      data.content = learnDetail.data.data.content;
    };

    const handleVideoItemClick = async () => {
      data.showVideo = true;
      data.currentMenuIndex = `chapter-video`;
      data.currentChapterId = -1;
    };

    const jumpToUrl = (url: string) => {
      window.open(url);
    };

    onMounted(async () => {
      const learnId = router.currentRoute.value.params.learnId;
      const learnInfo = await http.get('/api/learn', { params: { learnId } });
      const name = learnInfo.data.data[0].name;
      const imageUrl = learnInfo.data.data[0].imageUrl;
      const chapterList = learnInfo.data.data[0].detailList;
      const chapterId = chapterList[0].chapterId;

      data.name = name;
      data.imageUrl = imageUrl;
      data.chapterList = chapterList;
      data.currentChapterId = chapterId;
      data.currentMenuIndex = 'chapter-0';

      const [learnDetail, learnVideo] = await Promise.all([
        http.get('/api/learn/detail', { params: { learnId, chapterId } }),
        http.get('/api/learn/video', { params: { learnId } })
      ]);
      data.content = learnDetail.data.data.content;
      data.videoList = learnVideo.data.data;
    });

    return {
      ...toRefs(data),
      handleMenuItemClick,
      handleVideoItemClick,
      jumpToUrl
    };
  }
};
</script>

<style scoped>
.learn-detail {
  text-align: left;
}
.learn-detail-menu {
  width: 200px;
  flex-shrink: 0;
  min-height: calc(100vh - 61px);
}
.learn-video {
  flex-wrap: wrap;
}
.learn-video-card {
  margin: 20px;
  width: 300px;
  height: 260px;
  cursor: pointer;
}
.learn-video-card-image {
  width: 300px;
  height: 200px;
  object-fit: cover;
  display: block;
}
.learn-video-card-text {
  margin: 20px;
  height: 20px;
  line-height: 20px;
  text-align: center;
}
</style>
