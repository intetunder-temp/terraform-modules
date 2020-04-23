resource "google_dns_managed_zone" "google-apis" {
  name        = "google-apis"
  project     = var.project
  dns_name    = "googleapis.com."
  description = "private zone for Google API's"

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = var.network
    }
  }
}

resource "google_dns_record_set" "restricted-google-apis-A-record" {
  name    = "restricted.googleapis.com."
  project = var.project
  type    = "A"
  ttl     = 300

  managed_zone = "${google_dns_managed_zone.google-apis.name}"

  rrdatas = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
}

resource "google_dns_record_set" "google-api-CNAME" {
  name    = "*.googleapis.com."
  project = var.project
  type    = "CNAME"
  ttl     = 300

  managed_zone = "${google_dns_managed_zone.google-apis.name}"

  rrdatas = ["restricted.googleapis.com."]
}

resource "google_dns_managed_zone" "gcr-io" {
  name        = "gcr-io"
  project     = var.project
  dns_name    = "gcr.io."
  description = "private zone for GCR.io"

  visibility = "private"

  private_visibility_config {
    networks {
      network_url = var.network
    }
  }
}

resource "google_dns_record_set" "restricted-gcr-io-A-record" {
  name    = "gcr.io."
  project = var.project
  type    = "A"
  ttl     = 300

  managed_zone = "${google_dns_managed_zone.gcr-io.name}"

  rrdatas = ["199.36.153.4", "199.36.153.5", "199.36.153.6", "199.36.153.7"]
}

resource "google_dns_record_set" "gcr-io-CNAME" {
  name    = "*.gcr.io."
  project = var.project
  type    = "CNAME"
  ttl     = 300

  managed_zone = "${google_dns_managed_zone.gcr-io.name}"

  rrdatas = ["gcr.io."]
}
