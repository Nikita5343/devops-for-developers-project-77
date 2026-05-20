output "web_external_ips" {
  value = [
    for vm in yandex_compute_instance.web :
    vm.network_interface[0].nat_ip_address
  ]
}

output "web_internal_ips" {
  value = [
    for vm in yandex_compute_instance.web :
    vm.network_interface[0].ip_address
  ]
}

output "app_url" {
  value = "https://${var.domain_name}"
}