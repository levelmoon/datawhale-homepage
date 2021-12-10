<template>
  <div class="learn-detail">learnDetail</div>
</template>

<script lang="ts">
import { useRouter } from 'vue-router';

export default {
  setup() {
    const router = useRouter();
    console.log('router: ', router.currentRoute.value.params.learnId);
    return {};
  }
};
</script>

<style scoped>
</style>
