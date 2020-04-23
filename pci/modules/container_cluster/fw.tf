resource "google_compute_firewall" "egress_deny_all" {
  provider           = "google-beta"
  name               = "egress-deny-all"
  network            = var.network
  project            = var.project
  priority           = "65535"
  direction          = "EGRESS"
  enable_logging     = var.logging
  destination_ranges = ["0.0.0.0/0"]
  deny {
    protocol = "all"
  }
}
resource "google_compute_firewall" "ingress_deny_all" {
  provider       = "google-beta"
  name           = "ingress-deny-all"
  network        = var.network
  project        = var.project
  priority       = "65535"
  enable_logging = var.logging
  direction      = "INGRESS"
  source_ranges  = ["0.0.0.0/0"]
  deny {
    protocol = "all"
  }
}


resource "google_compute_firewall" "allow-healthcheck-ingress" {
  provider       = "google-beta"
  name           = "allow-healthcheck-ingress"
  network        = var.network
  project        = var.project
  priority       = "1000"
  enable_logging = var.logging

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  direction     = "INGRESS"
  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
}

resource "google_compute_firewall" "allow-healthcheck-egress" {
  provider       = "google-beta"
  name           = "allow-healthcheck-egress"
  network        = var.network
  project        = var.project
  priority       = "1000"
  enable_logging = var.logging

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  direction          = "EGRESS"
  destination_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
}
resource "google_compute_firewall" "allow-google-apis" {
  provider       = "google-beta"
  name           = "allow-google-apis"
  network        = var.network
  project        = var.project
  priority       = "1000"
  enable_logging = var.logging


  allow {
    protocol = "all"
  }

  direction          = "EGRESS"
  destination_ranges = ["199.36.153.4/30"]
}
resource "google_compute_firewall" "allow-master-node-egress" {
  provider       = "google-beta"
  name           = "allow-google-master-egress"
  network        = var.network
  project        = var.project
  priority       = "1000"
  enable_logging = var.logging


  allow {
    protocol = "tcp"
    ports    = ["443", "10250"]
  }

  direction          = "EGRESS"
  destination_ranges = [var.master_ipv4_cidr_block]
}
resource "google_compute_firewall" "allow-node-node-egress" {
  provider       = "google-beta"
  name           = "allow-node-node-egress"
  network        = var.network
  project        = var.project
  priority       = "1000"
  enable_logging = var.logging


  allow {
    protocol = "all"
  }

  direction          = "EGRESS"
  destination_ranges = var.subnet_ranges
}





resource "google_compute_firewall" "tf-allow-github-egress" {
  provider       = "google-beta"
  network        = var.network
  project        = var.project
  priority       = "1000"
  enable_logging = var.logging
  name           = "tf-allow-github-egress"
  allow {
    protocol = "tcp"
  }

  direction = "EGRESS"
  destination_ranges = [
    "192.30.252.0/22",
    "185.199.108.0/22",
    "140.82.112.0/20",
    "13.114.40.48/32",
    "13.229.188.59/32",
    "13.234.176.102/32",
    "13.234.210.38/32",
    "13.236.229.21/32",
    "13.237.44.5/32",
    "13.250.177.223/32",
    "15.164.81.167/32",
    "18.194.104.89/32",
    "18.195.85.27/32",
    "35.159.8.160/32",
    "52.192.72.89/32",
    "52.64.108.95/32",
    "52.69.186.44/32",
    "52.74.223.119/32",
    "52.78.231.108/32"
  ]
}
# Open firewall rule for alertmanager to reach slack
resource "google_compute_firewall" "allow-alertmanager-egress" {
  name     = "allow-alertmanager-egress"
  project  = var.project
  network  = var.network
  priority = "1000"
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  target_tags = ["alertmanager"]
  direction   = "EGRESS"
}

resource "google_compute_firewall" "tf-allow-tns-egress" {
  provider       = "google-beta"
  network        = var.network
  project        = var.project
  priority       = "1000"
  enable_logging = var.logging
  name           = "tf-allow-tns-egress"
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  direction = "EGRESS"
  destination_ranges = [
    "185.175.205.180/32",
    # vault.automationcloud.net
    "104.199.90.103/32",
    "35.187.162.160/32",
    # api.automationcloud.net
    "35.240.58.200/32",
    "35.190.195.159/32",
    "35.195.149.136/32",
  ]
}
resource "google_compute_firewall" "tf-allow-gstatic-egress" {
  provider       = "google-beta"
  network        = var.network
  project        = var.project
  priority       = "1000"
  enable_logging = var.logging
  name           = "tf-allow-gstatic-egress"
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  direction = "EGRESS"
  destination_ranges = [
    "216.58.192.0/19",
    "172.217.0.0/16",
  ]
}

