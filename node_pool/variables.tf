######## GKE worker nodes configuration variables ########
# List of map containing all node pools infos
variable "name" {}
variable "autoscaling" {}
variable "min_node_count" {}
variable "max_node_count" {}
variable "node_count" {}
variable "auto_repair" {}
variable "auto_upgrade" {}
variable "image_type" {}
variable "disk_size_gb" {}
variable "disk_type" {}
variable "machine_type" {}
variable "n2_instance" {}
variable "preemptible" {}
variable "node_metadata" {}
variable "gke_project" {}
variable "cluster_name" {}
variable "local_ssd_count" {}
variable "region" {}
variable "max_pods" {}

variable "node_pools_taints" {
  type        = map(list(object({ key = string, value = string, effect = string })))
  description = "Map of lists containing node taints by node-pool name"

  default = {
    all = []
  }
}




variable "node_pools_labels" {
  type        = map(map(string))
  description = "Map of maps containing node labels by node-pool name"

  default = {
    all = {}
  }
}

