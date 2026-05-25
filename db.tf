resource "yandex_mdb_postgresql_cluster" "main" {
  name        = "project-77-db"
  environment = "PRESTABLE"
  network_id  = yandex_vpc_network.main.id

  config {
    version = "15"

    resources {
      resource_preset_id = "s2.micro"
      disk_type_id       = "network-hdd"
      disk_size          = 10
    }
  }

  host {
    zone      = var.yc_zone
    subnet_id = yandex_vpc_subnet.main.id
  }
}

resource "yandex_mdb_postgresql_user" "app" {
  cluster_id = yandex_mdb_postgresql_cluster.main.id
  name       = var.db_user
  password   = var.db_password
}

resource "yandex_mdb_postgresql_database" "app" {
  cluster_id = yandex_mdb_postgresql_cluster.main.id
  name       = var.db_name
  owner      = yandex_mdb_postgresql_user.app.name
}