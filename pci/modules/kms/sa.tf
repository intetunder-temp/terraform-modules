#### CHD ####
resource "google_service_account" "chd_creator" {
  project      = var.project
  account_id   = "tf-ccv-chd-creator"
  display_name = "Terraform Managed SA CHD Creator"
}
resource "google_service_account" "chd_deleter" {
  project      = var.project
  account_id   = "tf-ccv-chd-deleter"
  display_name = "Terraform Managed SA CHD Deleter"
}
resource "google_service_account" "chd_viewer" {
  project      = var.project
  account_id   = "tf-ccv-chd-viewer"
  display_name = "Terraform Managed SA CHD Viewer"
}

#### SAD #####
resource "google_service_account" "sad_creator" {
  project      = var.project
  account_id   = "tf-ccv-sad-creator"
  display_name = "Terraform Managed SA SAD Creator"
}
resource "google_service_account" "sad_deleter" {
  project      = var.project
  account_id   = "tf-ccv-sad-deleter"
  display_name = "Terraform Managed SA SAD Deleter"
}
resource "google_service_account" "sad_viewer" {
  project      = var.project
  account_id   = "tf-ccv-sad-viewer"
  display_name = "Terraform Managed SA SAD Viewer"
}

# LODGED CARDS
#### CHD ####
resource "google_service_account" "chd_creator_lodged" {
  project      = var.project
  account_id   = "tf-ccv-chd-creator-lodged"
  display_name = "Terraform Managed SA CHD Creator LC"
}
resource "google_service_account" "chd_viewer_lodged" {
  project      = var.project
  account_id   = "tf-ccv-chd-viewer-lodged"
  display_name = "Terraform Managed SA CHD Viewer LC"
}

#### SAD #####
resource "google_service_account" "sad_creator_lodged" {
  project      = var.project
  account_id   = "tf-ccv-sad-creator-lodged"
  display_name = "Terraform Managed SA SAD Creator LC"
}
resource "google_service_account" "sad_viewer_lodged" {
  project      = var.project
  account_id   = "tf-ccv-sad-viewer-lodged"
  display_name = "Terraform Managed SA SAD Viewer LC"
}

