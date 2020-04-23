### CHD ###
resource "google_project_iam_custom_role" "custom_roles_chd_encrypt" {
  project     = google_project.chd.project_id
  role_id     = "lvhpaykmsencrypt"
  title       = "Terraform Managed Encrypt"
  description = "Terraform Managed"
  permissions = ["cloudkms.cryptoKeyVersions.useToEncrypt"]
}
resource "google_project_iam_custom_role" "custom_roles_chd_decrypt" {
  project     = google_project.chd.project_id
  role_id     = "lvhpaykmsdecrypt"
  title       = "Terraform Managed Decrypt"
  description = "Terraform Managed"
  permissions = ["cloudkms.cryptoKeyVersions.useToDecrypt"]
}

#### BUCKET ####
resource "google_project_iam_custom_role" "custom_roles_bucket_chd_deleter" {
  project     = google_project.chd.project_id
  role_id     = "lvhpaybucketdeleter"
  title       = "Terraform Managed Deleter"
  description = "Terraform Managed"
  permissions = ["storage.buckets.get", "storage.objects.delete"]
}
resource "google_project_iam_custom_role" "custom_roles_bucket_chd_creator" {
  project     = google_project.chd.project_id
  role_id     = "lvhpaybucketcreator"
  title       = "Terraform Managed Creator"
  description = "Terraform Managed"
  permissions = ["storage.buckets.get", "storage.objects.create"]
}
resource "google_project_iam_custom_role" "custom_roles_bucket_chd_viewer" {
  project     = google_project.chd.project_id
  role_id     = "lvhpaybucketviewer"
  title       = "Terraform Managed Viewer"
  description = "Terraform Managed"
  permissions = ["storage.buckets.get", "storage.objects.get"]
}
### SAD ###
resource "google_project_iam_custom_role" "custom_roles_sad_encrypt" {
  project     = google_project.sad.project_id
  role_id     = "lvhpaykmsencrypt"
  title       = "Terraform Managed Encrypt"
  description = "Terraform Managed"
  permissions = ["cloudkms.cryptoKeyVersions.useToEncrypt"]
}
resource "google_project_iam_custom_role" "custom_roles_sad_decrypt" {
  project     = google_project.sad.project_id
  role_id     = "lvhpaykmsdecrypt"
  title       = "Terraform Managed Decrypt"
  description = "Terraform Managed"
  permissions = ["cloudkms.cryptoKeyVersions.useToDecrypt"]
}

#### BUCKET ####
resource "google_project_iam_custom_role" "custom_roles_bucket_sad_deleter" {
  project     = google_project.sad.project_id
  role_id     = "lvhpaybucketdeleter"
  title       = "Terraform Managed Deleter"
  description = "Terraform Managed"
  permissions = ["storage.buckets.get", "storage.objects.delete"]
}
resource "google_project_iam_custom_role" "custom_roles_bucket_sad_creator" {
  project     = google_project.sad.project_id
  role_id     = "lvhpaybucketcreator"
  title       = "Terraform Managed Creator"
  description = "Terraform Managed"
  permissions = ["storage.buckets.get", "storage.objects.create"]
}
resource "google_project_iam_custom_role" "custom_roles_bucket_sad_viewer" {
  project     = google_project.sad.project_id
  role_id     = "lvhpaybucketviewer"
  title       = "Terraform Managed Viewer"
  description = "Terraform Managed"
  permissions = ["storage.buckets.get", "storage.objects.get"]
}


# LODGED CARDS
### CHD ###
resource "google_project_iam_custom_role" "custom_roles_chd_encrypt_lodged" {
  project     = google_project.chd_lodged.project_id
  role_id     = "lvhpaykmsencrypt"
  title       = "Terraform Managed Encrypt"
  description = "Terraform Managed"
  permissions = ["cloudkms.cryptoKeyVersions.useToEncrypt"]
}
resource "google_project_iam_custom_role" "custom_roles_chd_decrypt_lodged" {
  project     = google_project.chd_lodged.project_id
  role_id     = "lvhpaykmsdecrypt"
  title       = "Terraform Managed Decrypt"
  description = "Terraform Managed"
  permissions = ["cloudkms.cryptoKeyVersions.useToDecrypt"]
}

#### BUCKET ####
resource "google_project_iam_custom_role" "custom_roles_bucket_chd_creator_lodged" {
  project     = google_project.chd_lodged.project_id
  role_id     = "lvhpaybucketcreator"
  title       = "Terraform Managed Creator"
  description = "Terraform Managed"
  permissions = ["storage.buckets.get", "storage.objects.create"]
}
resource "google_project_iam_custom_role" "custom_roles_bucket_chd_viewer_lodged" {
  project     = google_project.chd_lodged.project_id
  role_id     = "lvhpaybucketviewer"
  title       = "Terraform Managed Viewer"
  description = "Terraform Managed"
  permissions = ["storage.buckets.get", "storage.objects.get"]
}
### SAD ###
resource "google_project_iam_custom_role" "custom_roles_sad_encrypt_lodged" {
  project     = google_project.sad_lodged.project_id
  role_id     = "lvhpaykmsencrypt"
  title       = "Terraform Managed Encrypt"
  description = "Terraform Managed"
  permissions = ["cloudkms.cryptoKeyVersions.useToEncrypt"]
}
resource "google_project_iam_custom_role" "custom_roles_sad_decrypt_lodged" {
  project     = google_project.sad_lodged.project_id
  role_id     = "lvhpaykmsdecrypt"
  title       = "Terraform Managed Decrypt"
  description = "Terraform Managed"
  permissions = ["cloudkms.cryptoKeyVersions.useToDecrypt"]
}

#### BUCKET ####
resource "google_project_iam_custom_role" "custom_roles_bucket_sad_creator_lodged" {
  project     = google_project.sad_lodged.project_id
  role_id     = "lvhpaybucketcreator"
  title       = "Terraform Managed Creator"
  description = "Terraform Managed"
  permissions = ["storage.buckets.get", "storage.objects.create"]
}
resource "google_project_iam_custom_role" "custom_roles_bucket_sad_viewer_lodged" {
  project     = google_project.sad_lodged.project_id
  role_id     = "lvhpaybucketviewer"
  title       = "Terraform Managed Viewer"
  description = "Terraform Managed"
  permissions = ["storage.buckets.get", "storage.objects.get"]
}

