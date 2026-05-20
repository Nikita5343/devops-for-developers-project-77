resource "yandex_dns_zone" "main" {
  name        = "project-77-zone"
  description = "DNS zone for ${var.domain_name}"
  zone        = "${var.domain_name}."
  public      = true
}