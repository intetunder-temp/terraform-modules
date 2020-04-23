######## GKE worker nodes configuration variables ########
# List of map containing all node pools infos
variable "name" {
  description = "The name of the node pool."
}
variable "autoscaling" {
  description = "Configuration required by cluster autoscaler to adjust the size of the node pool to the current cluster usage."
}
variable "min_node_count" {
  description = "Minimum number of nodes in the NodePool. Must be >=0 and <= max_node_count."
}
variable "max_node_count" {
  description = "Maximum number of nodes in the NodePool. Must be >= min_node_count."
}
variable "node_count" {
  description = "The number of nodes per instance group. This field can be used to update the number of nodes per instance group but should not be used alongside autoscaling."
}
variable "auto_repair" {
  description = "Whether the nodes will be automatically repaired."
}
variable "auto_upgrade" {
  description = "Whether the nodes will be automatically upgraded."
}
variable "image_type" {
  description = "The image type to use for this node. Note that changing the image type will delete and recreate all nodes in the node pool."
}
variable "disk_size_gb" {
  description = "Size of the disk attached to each node, specified in GB. The smallest allowed disk size is 10GB. Defaults to 100GB."
}
variable "disk_type" {
  description = "Type of the disk attached to each node (e.g. 'pd-standard' or 'pd-ssd'). If unspecified, the default disk type is 'pd-standard'"
}
variable "machine_type" {
  description = "The name of a Google Compute Engine machine type. Defaults to n1-standard-1."
}
variable "n2_instance" {
  description = "True/False value if you are going to be using N2 instances (we use this variable to change the CPU settings)"
}
variable "preemptible" {
  description = "A boolean that represents whether or not the underlying node VMs are preemptible."
}
variable "node_metadata" {
  description = "How to expose the node metadata to the workload running on the node."
}
variable "project" {
  description = "The ID of the project in which the resource belongs."
}
variable "cluster_name" {
  description = "Name of the cluster to attach the node pools too"
}
variable "local_ssd_count" {
  description = "The amount of local SSD disks that will be attached to each cluster node. Defaults to 0."
}
variable "region" {
  description = " The list of zones in which the cluster's nodes are located. Nodes must be in the region of their regional cluster or in the same region as their cluster's zone for zonal clusters. If this is specified for a zonal cluster, omit the cluster's zone."
}
variable "max_pods" {
  description = "The maximum number of pods per node in this node pool."
}
variable "tags" {
  description = "The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls."
}

variable cluster_endpoint {
  description = "Null resource that tells the node pool to not be created before the master endpoint is ready, will fail if the node pools is created before the master endpoint is ready"
}

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

