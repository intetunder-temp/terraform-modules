module container_cluster {
  source                     = "./modules/container_cluster"
  logging                    = var.fw_logging
  project                    = module.project.project_id
  cluster_name               = module.project.project_id
  cluster_label              = module.project.project_id
  region                     = module.network.subnets_regions[0]
  kube_version               = "1.14"
  network                    = module.network.network_self_link
  gke_subnetwork             = module.network.subnets_self_links[0]
  distribution_policy_zones  = ["europe-west2-a", "europe-west2-b", "europe-west2-c", ]
  team_label                 = "pci"
  enable_private_nodes       = true
  enable_private_endpoint    = true
  http_load_balancing        = true
  monitoring_service         = "monitoring.googleapis.com/kubernetes"
  logging_service            = "logging.googleapis.com/kubernetes"
  horizontal_pod_autoscaling = true
  kubernetes_dashboard       = false
  istio_config               = false
  cloudrun_config            = false
  network_policy_provider    = "CALICO"
  master_ipv4_cidr_block     = "172.16.0.16/28"
  enable_shielded_nodes      = var.enable_shielded_nodes
  security_group             = "gke-security-groups@darknet.fyi"
  pod_security_policy        = true
  workload_identity          = true
  #subnet_ranges              = [var.pods_subnet_cidr, module.network.subnets_ips[0]]
  subnet_ranges = [var.pods_subnet_cidr, var.subnet_cidr]
}
module "gke-darknet-inscope-node-pool" {
  source           = "./modules/node_pool"
  cluster_name     = module.project.project_id
  project          = module.project.project_id
  name             = "inscope"
  max_pods         = "60"
  autoscaling      = var.inscope_autoscaling
  min_node_count   = var.inscope_min_node_count
  max_node_count   = var.inscope_max_node_count
  node_count       = var.inscope_node_count
  local_ssd_count  = "0"
  region           = "europe-west2"
  auto_repair      = "true"
  auto_upgrade     = "true"
  image_type       = "COS"
  disk_size_gb     = "30"
  disk_type        = "pd-ssd"
  machine_type     = var.inscope_machine_type
  n2_instance      = false
  preemptible      = "false"
  node_metadata    = "GKE_METADATA_SERVER"
  tags             = []
  cluster_endpoint = module.container_cluster.endpoint

  node_pools_labels = {
    all = {}
    inscope = {
      workload = "in-scope"
      suffix   = "true"
    }
  }
  node_pools_taints = {
    all = []
    inscope = [
      {
        key    = "workload"
        value  = "in-scope"
        effect = "NO_SCHEDULE"
      }
    ]
  }
}
module "gke-darknet-outofscope-node-pool" {
  source           = "./modules/node_pool"
  cluster_name     = module.project.project_id
  project          = module.project.project_id
  name             = "outofscope"
  max_pods         = "60"
  autoscaling      = var.outofscope_autoscaling
  min_node_count   = var.outofscope_min_node_count
  max_node_count   = var.outofscope_max_node_count
  node_count       = var.outofscope_node_count
  local_ssd_count  = "0"
  region           = "europe-west2"
  auto_repair      = "true"
  auto_upgrade     = "true"
  image_type       = "COS"
  disk_size_gb     = "30"
  disk_type        = "pd-ssd"
  machine_type     = var.outofscope_machine_type
  n2_instance      = false
  preemptible      = "false"
  node_metadata    = "GKE_METADATA_SERVER"
  tags             = []
  cluster_endpoint = module.container_cluster.endpoint

  node_pools_labels = {
    all = {}
    outofscope = {
      workload = "outofscope"
      suffix   = "false"
    }
  }
  node_pools_taints = {
    all        = []
    outofscope = []
  }
}

module "gke-darknet-outofscope-alertmanager-node-pool" {
  source           = "./modules/node_pool"
  cluster_name     = module.project.project_id
  project          = module.project.project_id
  name             = "outofscope-alertmanager"
  max_pods         = "10"
  autoscaling      = var.outofscope_alertmanager_autoscaling
  min_node_count   = var.outofscope_alertmanager_min_node_count
  max_node_count   = var.outofscope_alertmanager_max_node_count
  node_count       = var.outofscope_alertmanager_node_count
  local_ssd_count  = "0"
  region           = "europe-west2"
  auto_repair      = "true"
  auto_upgrade     = "true"
  image_type       = "COS"
  disk_size_gb     = "30"
  disk_type        = "pd-ssd"
  machine_type     = var.outofscope_alertmanager_machine_type
  n2_instance      = false
  preemptible      = "false"
  node_metadata    = "GKE_METADATA_SERVER"
  tags             = ["alertmanager"]
  cluster_endpoint = module.container_cluster.endpoint

  node_pools_labels = {
    all = {}
    outofscope-alertmanager = {
      workload = "alertmanager"
      apps     = "alertmanager-only"
    }
  }
  node_pools_taints = {
    all = []
    outofscope-alertmanager = [
      {
        key    = "workload"
        value  = "alertmanager"
        effect = "NO_SCHEDULE"
    }]
  }
}







module "iap_bastion-dev" {
  source  = "./modules/bastion"
  project = module.project.project_id
  region  = "europe-west2"
  zone    = "europe-west2-c"
  network = module.network.network_self_link
  subnet  = module.network.subnets_self_links[0]
  members = [
    "group:devops@darknet.fyi",
    "group:developers@darknet.fyi",
  ]
}

