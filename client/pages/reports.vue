<template>
  <div class="row">
    <div class="col">
      <div class="card">
        <div class="card-header">
          <h5 class="card-title">Reports</h5>
        </div>
        <div class="card-body">
          <canvas id="reports"></canvas>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { getReports } from '../graphql/queries/user.gql'
import Chart from 'chart.js'

export default {
  apollo: {
    reports: {
      query: getReports,
      variables () {
        return {
          viewed_at: ['2020-05-01', '2020-06-01']
        }
      }
    }
  },

  data: () => ({
    reports: []
  }),

  computed: {
    dates: function () {
      // return  ['January', 'February', 'March', 'April', 'May', 'June', 'July']
    
      return this.reports.map(i => i.date)
    },

    views: function () {
      // return [200,300,400,500,660,400,200]
      return this.reports.map(i => i.total_views)
    },

    config: function () {
      return {
        type: 'line',
        data: {
          labels: this.dates,
          datasets: [{
            label: 'Total views',
            backgroundColor: 'cyan',
            borderColor: 'cyan',
            data: this.views,
            fill: false,
          }]
        },
        options: {
          responsive: true,
          title: {
            display: true,
            text: 'Reports'
          },
          tooltips: {
            mode: 'index',
            intersect: false,
          },
          hover: {
            mode: 'nearest',
            intersect: true
          },
          scales: {
            xAxes: [{
              display: true,
              scaleLabel: {
                display: true,
                labelString: 'Month'
              }
            }],
            yAxes: [{
              display: true,
              scaleLabel: {
                display: true,
                labelString: 'Value'
              }
            }]
          }
        }
      };
    }
  },

  watch: {
    'reports'(value) {
      if (Array.isArray(value) && value.length > 0) {
        let ctx = document.getElementById('reports').getContext('2d');
        new Chart(ctx, this.config);
      }
    }
  },
}
</script>
