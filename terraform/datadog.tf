resource "datadog_monitor" "http_check" {
  name    = "Project 77 HTTP healthcheck"
  type    = "metric alert"
  message = "HTTP healthcheck failed on one of the project-77 web servers"

  query = "avg(last_5m):min:http.can_connect{project:project-77} by {host} < 1"

  monitor_thresholds {
    critical = 1
  }

  notify_no_data    = true
  no_data_timeframe = 10
  include_tags      = true

  tags = [
    "project:project-77",
    "service:web"
  ]
}