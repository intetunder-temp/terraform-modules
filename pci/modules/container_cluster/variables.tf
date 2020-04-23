variable "subnet_ranges" {
  # Todo get it to pick it up from the VPC module
  description = "Subnet Ranges to of the pods and services in the VPC"
  type        = list
  default     = []
}
variable "logging" {
  description = "Turn on Logging on the FW-Rules"
  default     = false
  type        = bool
}

######## GKE vars ########
# Name of the GKE cluster
variable "cluster_name" {
  description = "Name of the cluster"
}
variable "master_authorized_networks_config" {
  type        = list(object({ cidr_blocks = list(object({ cidr_block = string, display_name = string })) }))
  description = "The desired configuration options for master authorized networks. The object format is {cidr_blocks = list(object({cidr_block = string, display_name = string}))}. Omit the nested cidr_blocks attribute to disallow external access (except the cluster node IPs, which GKE automatically whitelists)."
  default = [
    {
      cidr_blocks = [
        {
          display_name = "London Office"
          cidr_block   = "10.10.64.0/18"
        }
      ]
    }
  ]
}


variable "enable_shielded_nodes" {
  description = "Enable Shielded nodes in the node_pool"
  type        = bool
  default     = false
}
variable "workload_identity" {
  description = "Enable Workload Identity, will use the project variable to give the right name"
  default     = ""
}
variable "pod_security_policy" {
  description = "Pod Security Policy enable, should only be done for secure clusters"
  default     = ""
}


variable "services" {
  description = "An artificial dependency to bypass #10462"
  type        = list(string)
  default     = []
}

variable "project" {
  # Todo change to project
  description = "What project to put the GKE cluster in"
}
# Logging service that will be used
variable "logging_service" {
  description = "Logging service that will be used"
  default     = "logging.googleapis.com"
}

# Monitoring service that will be used
variable "monitoring_service" {
  description = "Monitoring service that will be used"
  default     = "monitoring.googleapis.com"
}

# Region where the cluster will be deployed
variable "region" {
  description = "Region where the cluster will be deployed"
}

# Network on which is sitting the cluster
variable "network" {
  description = "Name of the network in which the cluster will be sitting"
  default     = "default"
}

variable "master_ipv4_cidr_block" {
  description = "CIDR range of the master network, needs to /28 and GCP will create peering connections for us"
  default     = "172.16.0.16/28"
}

# Sub-network on which is sitting the cluster
variable "gke_subnetwork" {
  description = "Name of the sub-network in which the cluster will be sitting"
  default     = "projects/dev-lh-sharedvpc/regions/europe-west2/subnetworks/sn-data-pipeline"
}

# Kubernetes version
variable "kube_version" {
  description = "Kubernetes version"
  default     = "1.12.8-gke.10"
}

# Daily maintenance window start time (duration will always be the minimum one)
variable "daily_maintenance_window_start_time" {
  description = "Daily maintenance window start time (format 'HH:MM', where HH : [00-23] and MM : [00-59] GMT)"
  default     = "03:00"
}

variable "enable_private_nodes" {
  description = "Should private nodes be turned on addon be enabled? (true/false)"
  default     = true
}

variable "enable_private_endpoint" {
  description = "Should private master endpoint be turned on addon be enabled? (true/false)"
  default     = true
}


############## Addon vars ###########
# Should the following addons be disabled
variable "http_load_balancing" {
  description = "Should http_load_balancing addon be disabled? (true/false)"
  default     = "false"
}

variable "horizontal_pod_autoscaling" {
  description = "Should horizontal_pod_autoscaling addon be disabled? (true/false)"
  default     = "true"
}

variable "kubernetes_dashboard" {
  description = "Should kubernetes_dashboard addon be disabled? (true/false)"
  default     = "true"
}

variable "network_policy_config" {
  description = "Should Network Policies be turne don (currently only CALICO is supported)"
  default     = true
}
variable security_group {
  description = "The name of the RBAC security group for use with Google security groups in Kubernetes RBAC"
  default     = ""
}
variable "network_policy_provider" {
  description = "What Provider should the Net Policy use, currently only Calico is supported"
  default     = "CALICO"
}
variable "istio_config" {
  description = "Should istio_config addon be disabled? (true/false)"
  default     = "true"
}

variable "cloudrun_config" {
  description = "Should cloudrun_config addon be disabled? (true/false)"
  default     = "true"
}

variable "cluster_label" {
  description = "Labels to apply to the cluster"
  default     = "CHANGEME"
}
variable "team_label" {
  description = "What team is the cluster owned by"
  default     = "CHANGEME"
}
variable "distribution_policy_zones" {
  description = "The distribution policy, i.e. which zone(s) should instances be create in. Default is all zones in given region."
  type        = list(string)
  default     = []
}

