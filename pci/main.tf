module project {
  source      = "./modules/project"
  environment = var.environment
}
module kms {
  source       = "./modules/kms"
  environment  = var.environment
  project      = module.project.project_id
  audit_bucket = module.log_sinks.bucket_id
}

module network {
  source  = "terraform-google-modules/network/google"
  version = "~> 1.0.0"

  project_id                             = module.project.project_id
  network_name                           = "secure-vpc-${var.environment}"
  routing_mode                           = "GLOBAL"
  delete_default_internet_gateway_routes = true

  subnets = [
    {
      subnet_name           = "secure-subnet-01"
      subnet_ip             = "${var.subnet_cidr}"
      subnet_region         = "europe-west2"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    }
  ]

  secondary_ranges = {
    secure-subnet-01 = [
      {
        range_name    = "misc"
        ip_cidr_range = "${var.misc_subnet_cidr}"
      },
      {
        range_name    = "pods"
        ip_cidr_range = "${var.pods_subnet_cidr}"
      },
      {
        range_name    = "services"
        ip_cidr_range = "${var.services_subnet_cidr}"
      }
    ]
  }

  routes = [
    {
      name              = "egress-internet"
      description       = "route through IGW to access internet"
      destination_range = "0.0.0.0/0"
      next_hop_internet = "true"
    },
  ]
}
module "cloudnat" {
  source         = "./modules/cloudnat"
  region         = module.network.subnets_regions[0]
  project        = module.project.project_id
  network        = module.network.network_self_link
  project_number = module.project.project_number
}

##### Security Policies/CloudArmor
module security_policy {
  source        = "./modules/security_policy"
  src_ip_ranges = var.security_policy_src_ip_ranges
  project       = module.project.project_id
  action        = var.security_policy_action
  priority      = var.security_policy_priority
}
module "gke-static-ip" {
  source  = "./modules/pub_ip_global"
  names   = [
    "credit-card-collector-ccg-${var.environment}-darknet.fyi", 
    "credit-card-deleter-ccg-${var.environment}-darknet.fyi", 
    "credit-card-proxy-ccg-${var.environment}-darknet.fyi", 
    "credit-card-viewer-ccg-${var.environment}-darknet.fyi", 
    "grafana-${var.environment}-darknet.fyi",
    "eager-beaver-ccl-${var.environment}-darknet.fyi",
    "lumberjack-ccl-${var.environment}-darknet.fyi"
  ]

  project = module.project.project_id
}

module log_sinks {
  source               = "./modules/log_sinks"
  location             = module.network.subnets_regions[0]
  project              = module.project.project_id
  environment          = var.environment
  audit-logs-retention = var.audit-logs-retention
  app-logs-retention   = var.app-logs-retention
}

module dns {
  source          = "./modules/dns"
  environment     = var.environment
  project         = module.project.project_id
  collector_ip    = module.gke-static-ip.google_compute_global_address[0]
  deleter_ip      = module.gke-static-ip.google_compute_global_address[1]
  viewer_ip       = module.gke-static-ip.google_compute_global_address[3]
  proxy_ip        = module.gke-static-ip.google_compute_global_address[2]
  grafana_ip      = module.gke-static-ip.google_compute_global_address[4]
  eager_beaver_ip = module.gke-static-ip.google_compute_global_address[5]
  lumberjack_ip   = module.gke-static-ip.google_compute_global_address[6]
}

