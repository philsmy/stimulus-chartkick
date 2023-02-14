import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="purchases-chart"
export default class extends Controller {
  static targets = ['purchases']
  static values = {
    id: String,
    dateFilter: String,
    url: String,
  }
  connect() {
    var chart = Chartkick.charts[this.idValue]

    let _this = this

    let chartConfig = chart.getChartObject().config
    chartConfig.options.onClick = function(event, native, active) {
      if (native.length > 0) {
        let xAxisIndex = native[0].index
        let label = chart.getChartObject().data.labels[xAxisIndex]

        _this.dateFilterValue = label
        _this.loadChart()
      }
    }
  }

  loadChart() {
    fetch(this.urlValue + "?" + new URLSearchParams({date_filter: this.dateFilterValue}))
      .then(response => response.text())
      .then(html => {
        this.purchasesTarget.innerHTML = html
      })
  }
}
