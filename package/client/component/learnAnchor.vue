<template>
  <div class="learn-anchor">
    <el-timeline>
      <el-timeline-item v-for="(item, index) in anchorList" :key="`learn-anchor-item-${index}`">
        <div
          :class="item.href === activeAnchorHref ? 'learn-anchor-item-active' : 'learn-anchor-item'"
          @click="handleAnchorItemClick(item.href)"
        >
          {{ item.name }}
        </div>
      </el-timeline-item>
    </el-timeline>
    <!-- <div v-for="(item, index) in anchorList" :key="`learn-anchor-item-${index}`">
      <div
        :class="item.href === activeAnchorHref ? 'learn-anchor-item-active' : 'learn-anchor-item'"
        @click="handleAnchorItemClick(item.href)"
      >
        {{ item.name }}
      </div>
    </div> -->
  </div>
</template>

<script lang="ts">
import { reactive, toRefs } from 'vue';

interface ILearnAnchorProps {
  anchorList: { href: string; name: string }[];
  handleAnchorClick: (href: string) => void;
  activeAnchorHref: string;
}

export default {
  props: ['anchorList', 'handleAnchorClick', 'activeAnchorHref'],
  setup(props: ILearnAnchorProps) {
    const data = reactive({
      anchorList: props.anchorList,
      activeAnchorHref: props.activeAnchorHref
    });

    const getStatus = (href: string) => {
      if (href === data.activeAnchorHref) {
        return 'process';
      }
      return 'wait';
    };

    return {
      ...toRefs(data),
      handleAnchorItemClick: props.handleAnchorClick,
      getStatus
    };
  }
};
</script>

<style scoped>
.learn-anchor {
  padding: 10px 24px;
  cursor: pointer;
}
.learn-anchor-item {
  height: 20px;
  color: var(--el-text-color-primary);
}
.learn-anchor-item-active {
  height: 20px;
  color: var(--el-color-primary);
}
</style>
