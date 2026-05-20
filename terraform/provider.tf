terraform {
  required_version = ">= 1.3"

  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }

    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.91"
    }
  }
}

provider "yandex" {
  token     = var.yc_iam_token
  cloud_id  = var.yc_cloud_id
  folder_id = var.yc_folder_id
  zone      = var.yc_zone
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
  api_url = "https://api.${var.datadog_site}/"
}