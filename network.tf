module "network" {
  source       = "terraform-google-modules/network/google"
  version      = "13.0.0"
  project_id   = "arched-backup-479208-n1"
  network_name = "${var.env}-cloud-vpc-001"

  subnets = [
    {
      subnet_name   = "${var.env}-cloud-subnet-an1-001"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "asia-northeast1"
    },
    {
      subnet_name           = "${var.env}-cloud-subnet-an2-001"
      subnet_ip             = "10.10.20.0/24"
      subnet_region         = "asia-northeast2"
      subnet_private_access = "true"
    },
    {
      subnet_name               = "${var.env}-cloud-subnet-uw1-001"
      subnet_ip                 = "10.10.30.0/24"
      subnet_region             = "us-west1"
      subnet_private_access     = "true"
    }
  ]
}
