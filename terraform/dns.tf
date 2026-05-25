resource "yandex_dns_zone" "main" {
  name        = "project-77-zone"
  description = "Public DNS zone for project 77"
  zone        = "${var.domain_name}."
  public      = true
}

resource "yandex_dns_recordset" "app" {
  zone_id = yandex_dns_zone.main.id
  name    = "${var.domain_name}."
  type    = "A"
  ttl     = 300
  data    = [yandex_lb_network_load_balancer.web.listener[0].external_address_spec[0].address]
}