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

output "inventory" {
  value = join("\n", [
    "[web]",
    join("\n", [
      for ip in yandex_compute_instance.web[*].network_interface[0].nat_ip_address :
      "${ip} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa"
    ])
  ])
}