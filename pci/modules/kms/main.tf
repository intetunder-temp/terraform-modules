resource "google_kms_key_ring" "sad_ring" {
  project  = google_project.sad.project_id
  name     = "lvhpay-sad-ring"
  location = var.location
}
resource "google_kms_crypto_key" "sad_crypto_key" {
  name     = "lvhpay-sad-key"
  key_ring = google_kms_key_ring.sad_ring.self_link
}

resource "google_kms_key_ring" "chd_ring" {
  project  = google_project.chd.project_id
  name     = "lvhpay-chd-ring"
  location = var.location
}
resource "google_kms_crypto_key" "chd_crypto_key" {
  name     = "lvhpay-chd-key"
  key_ring = google_kms_key_ring.chd_ring.self_link
}

# LODGED CARDS
resource "google_kms_key_ring" "sad_ring_lodged" {
  project    = google_project.sad_lodged.project_id
  name       = "lvhpay-sad-ring"
  location   = var.location
  depends_on = [ google_project_service.sad_services_lodged ]
}
resource "google_kms_crypto_key" "sad_crypto_key_lodged" {
  name     = "lvhpay-sad-key"
  key_ring = google_kms_key_ring.sad_ring_lodged.self_link
}

resource "google_kms_key_ring" "chd_ring_lodged" {
  project    = google_project.chd_lodged.project_id
  name       = "lvhpay-chd-ring"
  location   = var.location
  depends_on = [ google_project_service.chd_services_lodged ]
}
resource "google_kms_crypto_key" "chd_crypto_key_lodged" {
  name     = "lvhpay-chd-key"
  key_ring = google_kms_key_ring.chd_ring_lodged.self_link
}
