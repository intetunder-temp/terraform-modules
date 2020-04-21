resource "google_container_cluster" "primary" {
  provider                    = "google-beta"
  project                     = var.gke_project
  name                        = var.cluster_name
  location                    = var.region
  network                     = var.network
  subnetwork                  = var.gke_subnetwork
  remove_default_node_pool    = true
  initial_node_count          = "1"
  logging_service             = var.logging_service
  monitoring_service          = var.monitoring_service
  node_locations              = var.distribution_policy_zones
  enable_binary_authorization = false
  # Master node version
  min_master_version        = var.kube_version
  default_max_pods_per_node = "110"
  # Set a maintancence window
  maintenance_policy {
    daily_maintenance_window {
      start_time = var.daily_maintenance_window_start_time
    }
  }
  resource_labels = merge(
    var.labels
  )

  # Basic auth disabled
  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
  ip_allocation_policy {
    cluster_secondary_range_name  = "pods"
    services_secondary_range_name = "services"
  }
  dynamic authenticator_groups_config {
    for_each = var.security_group != "" ? [var.security_group] : []
    content {
      security_group = var.security_group
    }
  }

  # Addons availables
  addons_config {
    http_load_balancing {
      disabled = ! var.http_load_balancing
    }

    horizontal_pod_autoscaling {
      disabled = ! var.horizontal_pod_autoscaling
    }

    network_policy_config {
      disabled = ! var.network_policy_config
    }

    istio_config {
      disabled = ! var.istio_config
    }

    cloudrun_config {
      disabled = ! var.cloudrun_config
    }
  }

  dynamic network_policy {
    for_each = var.network_policy_config == true ? [var.network_policy_config] : []
    content {
      enabled  = var.network_policy_config
      provider = var.network_policy_provider // CALICO is currently the only supported provider
    }
  }

  dynamic "master_authorized_networks_config" {
    for_each = var.master_authorized_networks_config
    content {
      dynamic "cidr_blocks" {
        for_each = master_authorized_networks_config.value.cidr_blocks
        content {
          cidr_block   = lookup(cidr_blocks.value, "cidr_block", "")
          display_name = lookup(cidr_blocks.value, "display_name", "")
        }
      }
    }
  }

  dynamic "private_cluster_config" {
    for_each = var.enable_private_nodes == "true" ? [var.enable_private_nodes] : []
    content {
      enable_private_endpoint = var.enable_private_endpoint
      enable_private_nodes    = var.enable_private_nodes
      master_ipv4_cidr_block  = var.master_ipv4_cidr_block
    }
  }
  # Modifing default timeout
  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }
}

