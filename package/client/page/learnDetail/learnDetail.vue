<template>
  <div class="learn-detail flex-row-left">
    <el-menu :default-active="currentMenuIndex" class="learn-detail-menu">
      <el-menu-item
        v-for="(item, index) in chapterList"
        :index="`chapter-${index}`"
        :key="`learn-menu-${index}`"
        @click="handleMenuItemClick(item.chapterId, index)"
      >
        <div class="learn-detail-menu-item">{{ item.title }}</div>
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
    <div class="learn-content" ref="learnContentElement">
      <div v-if="showVideo" class="learn-video flex-row-left">
        <el-card
          class="learn-video-card"
          v-for="(item, index) in videoList"
          :key="`learn-video-item-${index}`"
          :body-style="{ padding: '0px', width: '300px', height: '260px' }"
          @click="jumpToUrl(item.videoUrl)"
        >
          <img class="learn-video-card-image" :src="item.imageUrl" />
          <div class="learn-video-card-text">{{ item.title }}</div>
        </el-card>
      </div>
      <div v-else class="flex-row-space-between">
        <div class="markdownit" v-html="htmlContent" ref="markdownElement"></div>
        <div class="learn-anchor-wrapper">
          <learn-anchor
            :anchorList="anchorList"
            :handleAnchorClick="handleAnchorClick"
            :activeAnchorHref="activeAnchorHref"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import { onMounted, reactive, toRefs, ref, nextTick, onUnmounted } from 'vue';
import { useRouter } from 'vue-router';
import { http } from '../../service/axios';
import { convertMarkdownToHtml } from '../../util/convertMarkdown';
import learnAnchor from '../../component/learnAnchor.vue';
import { HEADER_HEIGHT, isInViewPort } from '../../util/scroll';

export default {
  components: { learnAnchor },
  setup() {
    const router = useRouter();
    const learnContentElement = ref<HTMLElement | null>(null);
    const markdownElement = ref<HTMLElement | null>(null);

    const data = reactive({
      name: '',
      imageUrl: '',
      chapterList: [],
      currentMenuIndex: 'chapter-0',
      currentChapterId: -1,
      htmlContent: '',
      videoList: [],
      showVideo: false,
      anchorList: [],
      activeAnchorHref: ''
    });

    const handleMenuItemClick = async (chapterId: number, index: number) => {
      const learnId = router.currentRoute.value.params.learnId || '';
      const learnDetail = await http.get('/api/learn/detail', { params: { learnId, chapterId } });
      data.showVideo = false;
      data.currentMenuIndex = `chapter-${index}`;
      data.currentChapterId = chapterId;
      const content = learnDetail.data.data.content;
      const { html, tag } = convertMarkdownToHtml(content);
      data.htmlContent = html;

      await nextTick();
      generateAnchorList(tag);
      setCurrentActiveAnchorHref();
    };

    const handleVideoItemClick = async () => {
      data.showVideo = true;
      data.currentMenuIndex = `chapter-video`;
      data.currentChapterId = -1;
    };

    const jumpToUrl = (url: string) => {
      window.open(url);
    };

    const generateAnchorList = (tag: string) => {
      const output = [];
      const elementList = markdownElement?.value?.getElementsByTagName(tag);
      if (elementList.length > 0) {
        for (let a = 0; a < elementList.length; a++) {
          const element = elementList[a];
          const elementContent = element.textContent;
          output.push({
            href: (element.parentNode as HTMLDivElement).id,
            name: elementContent
          });
        }
      }

      data.anchorList = output;
    };

    const handleAnchorClick = (href: string) => {
      data.activeAnchorHref = href;
      const targetElementTop = document.getElementById(href)?.offsetTop;
      if (targetElementTop !== undefined) {
        learnContentElement?.value?.scroll({
          top: targetElementTop - HEADER_HEIGHT + 1,
          behavior: 'auto'
        });
      }
    };

    const setCurrentActiveAnchorHref = () => {
      let activeHref = data.anchorList && data.anchorList[0] ? data.anchorList[0].href : '';
      for (const item of data.anchorList) {
        if (isInViewPort(document.getElementById(item.href))) {
          activeHref = item.href;
          break;
        }
      }
      data.activeAnchorHref = activeHref;
    };

    onMounted(async () => {
      learnContentElement?.value?.scroll(0, 0);

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
      const content = learnDetail.data.data.content;
      const { html, tag } = convertMarkdownToHtml(content);
      data.htmlContent = html;
      data.videoList = learnVideo.data.data;

      await nextTick();

      generateAnchorList(tag);
      setCurrentActiveAnchorHref();
      learnContentElement?.value?.addEventListener('scroll', setCurrentActiveAnchorHref);
    });

    return {
      ...toRefs(data),
      markdownElement,
      learnContentElement,
      handleMenuItemClick,
      handleVideoItemClick,
      jumpToUrl,
      handleAnchorClick
    };
  }
};
</script>

<style scoped>
.learn-detail {
  text-align: left;
  height: calc(100vh - 61px);
}
.learn-detail-menu {
  width: 250px;
  flex-shrink: 0;
  height: calc(100vh - 61px);
  overflow: auto;
}
.learn-detail-menu-item {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.learn-content {
  width: 100%;
  height: calc(100vh - 61px);
  overflow: auto;
}
.learn-anchor-wrapper {
  position: -webkit-sticky;
  position: sticky;
  width: 250px;
  height: 100%;
  flex-shrink: 0;
  top: 0;
  cursor: pointer;
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
