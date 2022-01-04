<template>
  <div class="knowledge-overview">
    <el-alert
      title="为什么会有AI知识体系"
      type="info"
      description="我们做了很久的内容了，希望能串起来给大家一些帮助，还有很多不足的地方，也欢迎大家一起来建设。"
      show-icon
      :closable="false"
    ></el-alert>
    <div class="knowledge-overview-chart" ref="chartElement"></div>
  </div>
</template>

<script lang="ts">
import { onMounted, ref } from 'vue';
import * as echarts from 'echarts';
import { http } from '../../service/axios';

export default {
  name: 'knowledge-overview',
  setup() {
    const chartElement = ref<HTMLElement | null>(null);

    onMounted(async () => {
      const myChart = echarts.init(chartElement.value);
      myChart.showLoading();
      const knowledgeOverviewRes = await http.get('/api/knowledge/mind');
      const overviewData = JSON.parse(knowledgeOverviewRes.data.data.content);
      myChart.hideLoading();

      const option = {
        title: {
          text: 'AI知识体系图',
          subtext: '知识体系可以拖动/缩放进行查看'
        },
        tooltip: {
          trigger: 'item',
          triggerOn: 'mousemove',
          formatter: (params) => {
            const name = params.treeAncestors.map((item) => item.name).join(' -> ');
            if (params.value) {
              return name + '<br/> 查看地址：' + params.value;
            }
            return name;
          }
        },
        series: [
          {
            type: 'tree',
            id: 0,
            data: [overviewData],
            name: 'AI知识体系图',
            symbol: 'none',
            symbolSize: 12,
            left: '8%',
            right: '20%',
            edgeShape: 'polyline',
            edgeForkPosition: '50%',
            initialTreeDepth: -1,
            lineStyle: {
              width: 2
            },
            label: {
              backgroundColor: '#fff',
              position: 'left',
              verticalAlign: 'middle',
              align: 'right'
            },
            leaves: {
              label: {
                position: 'right',
                verticalAlign: 'middle',
                align: 'left'
              }
            },
            expandAndCollapse: false,
            roam: true
          }
        ]
      };
      
      myChart.setOption(option);
      myChart.on('click', (param) => {
        if (param.value) {
          window.open(`${param.value}`);
        }
      });
    });

    return {
      chartElement
    };
  }
};
</script>

<style scoped>
.knowledge-overview {
  padding: 30px;
}
.knowledge-overview-introduction {
  background-color: #f4f4f4;
  border: 1px solid #b3b3b3;
  padding: 0.5rem;
}
.knowledge-overview-chart {
  margin-top: 30px;
  width: 100%;
  height: calc(100vh - 211px);
}
</style>
