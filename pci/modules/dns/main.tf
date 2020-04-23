resource "google_dns_managed_zone" "main_zone_non_prod" {
  name        = "${var.environment}-lvhpay-com"
  project     = var.project
  dns_name    = "${var.environment}.lvhpay.com."
  description = "private zone for ${var.environment}.lvhpay.com"

  visibility = "public"
}

resource "google_dns_record_set" "collector_non_prod_A_record" {
  count   = var.project == "lvhpay-production" ? 0 : 1
  name    = "collector.ccg.${var.environment}.lvhpay.com."
  project = var.project
  type    = "A"
  ttl     = 300

  managed_zone = google_dns_managed_zone.main_zone_non_prod.*.name[count.index]

  rrdatas = [var.collector_ip]
}
resource "google_dns_record_set" "viewer_A_record" {
  name    = "viewer.ccg.${var.environment}.lvhpay.com."
  project = var.project
  type    = "A"
  ttl     = 300

  managed_zone = google_dns_managed_zone.main_zone_non_prod.name

  rrdatas = [var.viewer_ip]
}
resource "google_dns_record_set" "proxy_A_record" {
  name    = "proxy.ccg.${var.environment}.lvhpay.com."
  project = var.project
  type    = "A"
  ttl     = 300

  managed_zone = google_dns_managed_zone.main_zone_non_prod.name

  rrdatas = [var.proxy_ip]
}
resource "google_dns_record_set" "deleter_A_record" {
  name    = "deleter.ccg.${var.environment}.lvhpay.com."
  project = var.project
  type    = "A"
  ttl     = 300

  managed_zone = google_dns_managed_zone.main_zone_non_prod.name

  rrdatas = [var.deleter_ip]
}
resource "google_dns_record_set" "grafana_A_record" {
  name    = "grafana.${var.environment}.lvhpay.com."
  project = var.project
  type    = "A"
  ttl     = 300

  managed_zone = google_dns_managed_zone.main_zone_non_prod.name

  rrdatas = [var.grafana_ip]
}

resource "google_dns_record_set" "eager_beaver_A_record" {
  name    = "eager-beaver.ccl.${var.environment}.lvhpay.com."
  project = var.project
  type    = "A"
  ttl     = 300

  managed_zone = google_dns_managed_zone.main_zone_non_prod.name

  rrdatas = [var.eager_beaver_ip]
}
resource "google_dns_record_set" "lumberjack_A_record" {
  name    = "lumberjack.ccl.${var.environment}.lvhpay.com."
  project = var.project
  type    = "A"
  ttl     = 300

  managed_zone = google_dns_managed_zone.main_zone_non_prod.name

  rrdatas = [var.lumberjack_ip]
}
