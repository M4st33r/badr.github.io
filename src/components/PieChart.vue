<template>
  <Pie :options="chartOptions" :data="chartData" />
</template>

<script>
import { Pie } from 'vue-chartjs'
import { Chart as ChartJS, ArcElement,  Colors, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'
ChartJS.register(ArcElement, Colors, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

export default {
  name: 'PieChart',
  components: { Pie },
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
            label: 'Sales',
            backgroundColor: ['#41B883', '#E46651', '#00D8FF', '#DD1B16'],
            data: [40, 20, 80, 10]
          }
        ]
      }
    }
  }
}
</script>

