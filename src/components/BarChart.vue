<template>
  <Bar :data="chartData" :options="chartOptions" />
</template>

<script>
import { Bar } from 'vue-chartjs'
import { Chart as ChartJS, Colors, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'
ChartJS.register(Colors, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

export default {
  name: 'BarChart',
  components: { Bar },
  data() {
    return {
      chartData: {
        labels: [ 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
        datasets: [
          {
            label: 'Sales',
            backgroundColor: ['#a98aed', '#f9694f'],
            data: [40, 20, 12, 33, 22, 19, 38, 60, 55, 44, 32, 19]
          }
        ]
      },
    chartOptions: {
        responsive: true,
        maintainAspectRatio: false
      }
    }
  }
}
</script>

