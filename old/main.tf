locals {
  subnet = {
    an1-001 = ["10.0.0.0/24", "asia-northeast1"]
    an2-001 = ["192.168.10.0/24", "asia-northeast2"]
    an2-002 = ["192.168.20.0/24", "asia-northeast2"]
  }
}

resource "google_compute_network" "custom_vpc" {
  name                    = "${var.env}-cloud-vpc-001"
  auto_create_subnetworks = false
  mtu                     = 1460

  delete_default_routes_on_create = false
}

resource "google_compute_subnetwork" "subnet" {
  for_each = local.subnet

  name          = "${var.env}-cloud-subnet-${each.key}"
  ip_cidr_range = each.value[0]
  region        = each.value[1]
  network       = google_compute_network.custom_vpc.id

  private_ip_google_access = false
  stack_type               = "IPV4_ONLY"
  purpose                  = "PRIVATE"
}


resource "google_compute_firewall" "vpc_fw_ingress" {
  for_each = local.subnet

  network   = google_compute_network.custom_vpc.id
  direction = "INGRESS"

  name          = "${var.env}-cloud-vpc-fw-${each.key}"
  source_ranges = ["0.0.0.0/0"]
  priority      = 10000

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}