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
  padding: 24px 24px 10px 0;
  cursor: pointer;
  overflow: auto;
  height: calc(100vh - 95px);
}
.learn-anchor-item {
  color: var(--el-text-color-primary);
}
.learn-anchor-item-active {
  color: var(--el-color-primary);
}
</style>
