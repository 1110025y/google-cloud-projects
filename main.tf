resource "google_storage_bucket" "my_bucket" {
  name                        = "${var.env}-cloud-storage-001"
  location                    = "ASIA-NORTHEAST1"
  force_destroy               = true
  uniform_bucket_level_access = true
  storage_class               = "STANDARD"
}

