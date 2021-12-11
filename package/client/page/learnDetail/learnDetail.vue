<template>
  <div class="learn-detail">learnDetail</div>
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
      currentChapterId: -1,
      content: '',
      videoList: []
    });

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

      const [learnDetail, learnVideo] = await Promise.all([
        http.get('/api/learn/detail', { params: { learnId, chapterId } }),
        http.get('/api/learn/video', { params: { learnId } })
      ]);
      data.content = learnDetail.data.data.content;
      data.videoList = learnVideo.data.data;

      console.log(
        'mounted data:',
        chapterList,
        chapterId,
        learnDetail.data.data.content,
        learnVideo.data.data
      );
    });

    return {
      ...toRefs(data)
    };
  }
};
</script>

<style scoped>
</style>
