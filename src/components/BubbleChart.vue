<template>
  <Bubble :options="chartOptions" :data="chartData" />
</template>

<script>
import { Bubble } from 'vue-chartjs'
import {
  Chart as ChartJS,
  Tooltip,
  Legend,
  PointElement,
  LinearScale
} from 'chart.js'
ChartJS.register(PointElement,  Tooltip, Legend,  LinearScale)

export default {
  name: 'BubbleChart',
  components: { Bubble },
  data() {
    return {
    chartOptions: {
        responsive: true,
        maintainAspectRatio: false
      },
      chartData: {
        labels: ['First Quarter', 'Second Quarter', 'Third Quarter', 'Fourth Quarter'],
        datasets: [
          {
            label: 'Data One',
            backgroundColor: '#f87979',
            data: [
              {
                x: 20,
                y: 25,
                r: 5
              },
              {
                x: 40,
                y: 10,
                r: 10
              },
              {
                x: 30,
                y: 22,
                r: 30
              }
            ]
          },
          {
            label: 'Data Two',
            backgroundColor: '#a98aed',
            data: [
              {
                x: 38,
                y:16,
                r: 13
              },
              {
                x: 16,
                y: 14,
                r: 13
              },
              {
                x: 25,
                y: 18,
                r: 45
              },
              {
                x: 20,
                y: 7,
                r: 9
              },
            ]
          },
          {
            label: 'Data Three',
            backgroundColor: '#41b883',
            data: [
              {
                x: 22,
                y: 22,
                r: 16
              },
              {
                x: 33,
                y: 10,
                r: 25
              },
              {
                x: 33,
                y: 17,
                r: 4,
              },
            ]
          }
        ]
      }
    }
  }
}
</script>

