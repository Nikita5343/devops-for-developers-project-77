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
  data    = [yandex_vpc_address.lb.external_ipv4_address[0].address]
}