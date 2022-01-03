<template>
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
          <div class="flex">
            <img :src="ele.img" alt="" style="max-height: 200px" />
            <div style="margin-left: 2rem">
              {{ ele.context }}
              <div>
                学习链接：<a :href="ele.url">{{ ele.url }}</a>
              </div>
            </div>
          </div>
        </el-card>
      </section>
    </el-timeline-item>
    <el-timeline-item timestamp="恭喜毕业啦!" placement="top" class="content-title">
    </el-timeline-item>
  </el-timeline>
</template>
<script lang="ts">
import { defineComponent, reactive, toRefs, SetupContext } from 'vue';
interface Data {}
export default defineComponent({
  name: '',
  props: {
    content: {
      type: Array,
      default: []
    }
  },
  setup(props, ctx: SetupContext) {
    let data: Data = reactive<Data>({});
    return {
      ...toRefs(data)
    };
  }
});
</script>
<style scoped lang="scss"></style>
