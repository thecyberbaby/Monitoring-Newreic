resource "newrelic_one_dashboard" "test_dashboard" {
  name        = "Nishant's Local Dashboard"
  permissions = "public_read_only"

  page {
    name = "test_dashboard"
    #Billboard
    widget_billboard {
      title  = "Logs"
      row    = 1
      column = 1
      width  = 6
      height = 3

      nrql_query {
        query = "SELECT count(*) FROM Log TIMESERIES SINCE 1800 seconds ago EXTRAPOLATE"
      }
    }
    #Load Average
    widget_bar {
      title  = "Load Average"
      row    = 1
      column = 7
      width  = 6
      height = 3

      nrql_query {
        account_id = var.account_id
        query      = "SELECT average(loadAverageOneMinute) AS 'One minute', average(loadAverageFiveMinute) AS 'Five minute', average(loadAverageFifteenMinute) AS 'Fifteen minute' FROM SystemSample TIMESERIES SINCE 1800 seconds ago EXTRAPOLATE"
      }
    }
    #CPU Average
    widget_bar {
      title  = "CPU Average in last 30 minuts"
      row    = 1
      column = 7
      width  = 6
      height = 3

      nrql_query {
        account_id = var.account_id
        query      = "SELECT average(cpuSystemPercent) AS 'System', average(cpuIOWaitPercent) AS 'I/O wait', average(cpuUserPercent) AS 'User', average(cpuStealPercent) AS 'Steal' FROM SystemSample TIMESERIES SINCE 1800 seconds ago EXTRAPOLATE"
      }
    }
    #Memory Average
    widget_bar {
      title  = "Mermory Average in last 30 minuts"
      row    = 1
      column = 7
      width  = 6
      height = 3

      nrql_query {
        account_id = var.account_id
        query      = "SELECT average(memoryUsedBytes / memoryTotalBytes * 100) AS 'Used %', average(memoryFreeBytes / memoryTotalBytes * 100) AS 'Free %' FROM SystemSample TIMESERIES SINCE 1800 seconds ago EXTRAPOLATE"
      }
    }
  }
}


