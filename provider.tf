# Configure the Google Cloud Provider
provider "google" {
  project     = "arched-backup-479208-n1"
  region      = "asia-northeast1"   # 東京リージョン
  credentials = file("~/.config/gcloud/service-accounts/arched-backup-479208-n1-153182ad3947.json")

  default_labels = {
    project     = "test"
    environment = var.env
  }
}


# We strongly recommend using the required_providers block to set the
# Google Cloud Provider source and version being use
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 7.12.0"
    }
  }
  backend "gcs" {
  }
}
