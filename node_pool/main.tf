resource "random_string" "this" {
  keepers = {
    project = var.gke_project
  }

  length  = 6
  upper   = false
  number  = false
  special = false
}



resource "google_container_node_pool" "node_pool" {
  project           = random_string.this.keepers.project
  provider          = "google-beta"
  name              = var.name
  location          = var.region
  cluster           = var.cluster_name
  node_count        = var.node_count
  max_pods_per_node = var.max_pods

  lifecycle {
    ignore_changes = [node_count]
  }
  dynamic autoscaling {
    for_each = var.autoscaling == true ? [var.name] : []
    content {
      min_node_count = var.min_node_count
      max_node_count = var.max_node_count
    }
  }

  management {
    auto_repair  = var.auto_repair
    auto_upgrade = var.auto_upgrade
  }

  node_config {
    oauth_scopes     = ["https://www.googleapis.com/auth/cloud-platform"]
    image_type       = var.image_type
    machine_type     = var.machine_type
    preemptible      = var.preemptible
    local_ssd_count  = var.local_ssd_count
    min_cpu_platform = var.n2_instance == false ? "Intel Broadwell" : "Intel Cascade Lake"
    disk_size_gb     = var.disk_size_gb
    disk_type        = var.disk_type
    service_account  = google_service_account.node_pool_service_account.email
    workload_metadata_config {
      node_metadata = var.node_metadata
    }
    labels = merge(
      {
        "cluster_name" = var.cluster_name
      },
      {
        "node_pool" = var.name
      },
      var.node_pools_labels["all"],
      var.node_pools_labels[var.name],
    )

    dynamic "taint" {
      for_each = concat(
        var.node_pools_taints["all"],
        var.node_pools_taints[var.name],
      )

      content {
        effect = taint.value.effect
        key    = taint.value.key
        value  = taint.value.value
      }
    }
  }
}

