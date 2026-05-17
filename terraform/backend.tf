terraform {
  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    region   = "ru-central1"

    bucket = "TODO_BUCKET_NAME"
    key    = "terraform/state.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
