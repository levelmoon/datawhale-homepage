<template>
  <h1>Vue3测试项目</h1>
  <h3 @click="testFunction">{{ testConst }}</h3>
</template>

<script>
import { reactive, toRefs } from "vue";

export default {
  setup() {
    const data = reactive({
      testConst: "点我",
    });
    const testFunction = () => {
      alert("hello world");
    };
    return {
      ...toRefs(data),
      testFunction,
    };
  },
};
</script>

<style scoped>
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

