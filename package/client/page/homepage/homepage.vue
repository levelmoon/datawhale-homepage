<template>
  <div class="homepage">
    <div class="homepage-left">
      <div>
        <el-carousel trigger="click" height="150px">
          <el-carousel-item v-for="(item, index) in banner" :key="`carousel-item-${index}`">
            <div>
              <img :src="item.url" />
              <div>{{ item.description }}</div>
            </div>
          </el-carousel-item>
        </el-carousel>
      </div>
      <div>
        <div>
          <div>热门学习</div>
          <div>查看更多</div>
        </div>
        <div v-for="(item, index) in learn" :key="`learn-${index}`">
          <div>
            <img :src="item.imageUrl" />
            <div>{{ item.name }}</div>
            <div>{{ item.description }}</div>
            <div>
              <div v-for="(tag, index) in item.tagList" :key="`learn-tag-${index}`">
                <div>
                  {{ tag.tagName }}
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="homepage-right">
      <div>
        <div>来一起参加活动吧</div>
        <div v-for="(item, index) in activity" :key="`activity-${index}`">
          <div>
            <div>{{ item.name }}</div>
            <div>{{ item.description }}</div>
            <div>点此参加</div>
            <div>{{ item.endTime }}</div>
          </div>
        </div>
      </div>
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
  width: 100vw;
  text-align: center;
  display: flex;
  flex-direction: row;
}
.homepage-left {
  display: flex;
  flex-direction: column;
}
.homepage-right {
  width: 300px;
  flex-shrink: 0;
  position: sticky;
  top: 61px;
}
h1 {
  width: 100vw;
  text-align: center;
  color: gray;
}
h3 {
  width: 100vw;
  text-align: center;
  color: gray;
  cursor: pointer;
}
</style>
