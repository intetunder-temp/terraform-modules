resource "google_storage_bucket_iam_member" "chd_viewer" {
  bucket     = google_storage_bucket.chd-bucket.id
  role       = google_project_iam_custom_role.custom_roles_bucket_chd_viewer.id
  member     = "serviceAccount:${google_service_account.chd_viewer.email}"
  depends_on = [google_service_account.chd_creator]
}
resource "google_storage_bucket_iam_member" "chd_deleter" {
  bucket     = google_storage_bucket.chd-bucket.id
  role       = google_project_iam_custom_role.custom_roles_bucket_chd_deleter.id
  member     = "serviceAccount:${google_service_account.chd_deleter.email}"
  depends_on = [google_service_account.chd_creator]
}
resource "google_storage_bucket_iam_member" "chd_creator" {
  bucket     = google_storage_bucket.chd-bucket.id
  role       = google_project_iam_custom_role.custom_roles_bucket_chd_creator.id
  member     = "serviceAccount:${google_service_account.chd_creator.email}"
  depends_on = [google_service_account.chd_creator]
}

resource "google_service_account_iam_binding" "credit-card-vault-chd-deleter" {
  service_account_id = google_service_account.chd_deleter.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project}.svc.id.goog[credit-card-vault/credit-card-vault-chd-deleter]",
  ]
  depends_on = [google_service_account.chd_creator]
}

resource "google_service_account_iam_binding" "credit-card-vault-chd-viewer" {
  service_account_id = google_service_account.chd_viewer.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project}.svc.id.goog[credit-card-vault/credit-card-vault-chd-viewer]",
  ]
  depends_on = [google_service_account.chd_creator]
}

resource "google_service_account_iam_binding" "credit-card-vault-chd-creator" {
  service_account_id = google_service_account.chd_creator.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project}.svc.id.goog[credit-card-vault/credit-card-vault-chd-creator]",
  ]
  depends_on = [google_service_account.chd_creator]
}

#### SAD ####
resource "google_storage_bucket_iam_member" "sad_viewer" {
  bucket = google_storage_bucket.sad-bucket.id
  role   = google_project_iam_custom_role.custom_roles_bucket_sad_viewer.id
  member = "serviceAccount:${google_service_account.sad_viewer.email}"
}
resource "google_storage_bucket_iam_member" "sad_deleter" {
  bucket = google_storage_bucket.sad-bucket.id
  role   = google_project_iam_custom_role.custom_roles_bucket_sad_deleter.id
  member = "serviceAccount:${google_service_account.sad_deleter.email}"
}
resource "google_storage_bucket_iam_member" "sad_creator" {
  bucket = google_storage_bucket.sad-bucket.id
  role   = google_project_iam_custom_role.custom_roles_bucket_sad_creator.id
  member = "serviceAccount:${google_service_account.sad_creator.email}"
}

resource "google_service_account_iam_binding" "credit-card-vault-sad-deleter" {
  service_account_id = google_service_account.sad_deleter.id
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project}.svc.id.goog[credit-card-vault/credit-card-vault-sad-deleter]",
  ]
}

resource "google_service_account_iam_binding" "credit-card-vault-sad-viewer" {
  service_account_id = google_service_account.sad_viewer.id
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project}.svc.id.goog[credit-card-vault/credit-card-vault-sad-viewer]",
  ]
}

resource "google_service_account_iam_binding" "credit-card-vault-sad-creator" {
  service_account_id = google_service_account.sad_creator.id
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project}.svc.id.goog[credit-card-vault/credit-card-vault-sad-creator]",
  ]
}


module "kms_sad" {
  source  = "./../iam/project_iam"
  project = google_project.sad.project_id
  mode    = "additive"
  bindings = {
    "${google_project_iam_custom_role.custom_roles_sad_encrypt.id}" = [
      "serviceAccount:${google_service_account.sad_creator.email}"
    ]
    "${google_project_iam_custom_role.custom_roles_sad_decrypt.id}" = [
      "serviceAccount:${google_service_account.sad_viewer.email}"
    ]
  }
}
module "kms_chd" {
  source  = "./../iam/project_iam"
  project = google_project.chd.project_id
  mode    = "additive"
  bindings = {
    "${google_project_iam_custom_role.custom_roles_chd_encrypt.id}" = [
      "serviceAccount:${google_service_account.chd_creator.email}"
    ]
    "${google_project_iam_custom_role.custom_roles_chd_decrypt.id}" = [
      "serviceAccount:${google_service_account.chd_viewer.email}"
    ]
  }
}


# LODGED CARDS
resource "google_storage_bucket_iam_member" "chd_viewer_lodged" {
  bucket     = google_storage_bucket.chd-bucket-lodged.id
  role       = google_project_iam_custom_role.custom_roles_bucket_chd_viewer_lodged.id
  member     = "serviceAccount:${google_service_account.chd_viewer_lodged.email}"
  depends_on = [google_service_account.chd_creator_lodged]
}
resource "google_storage_bucket_iam_member" "chd_creator_lodged" {
  bucket     = google_storage_bucket.chd-bucket-lodged.id
  role       = google_project_iam_custom_role.custom_roles_bucket_chd_creator_lodged.id
  member     = "serviceAccount:${google_service_account.chd_creator_lodged.email}"
  depends_on = [google_service_account.chd_creator_lodged]
}

resource "google_service_account_iam_binding" "credit-card-vault-chd-viewer-lodged" {
  service_account_id = google_service_account.chd_viewer_lodged.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project}.svc.id.goog[lodged-card-vault/lodged-card-vault-chd-viewer]",
  ]
  depends_on = [google_service_account.chd_creator_lodged]
}

resource "google_service_account_iam_binding" "credit-card-vault-chd-creator-lodged" {
  service_account_id = google_service_account.chd_creator_lodged.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project}.svc.id.goog[lodged-card-vault/lodged-card-vault-chd-creator]",
  ]
  depends_on = [google_service_account.chd_creator_lodged]
}

#### SAD ####
resource "google_storage_bucket_iam_member" "sad_viewer_lodged" {
  bucket = google_storage_bucket.sad-bucket-lodged.id
  role   = google_project_iam_custom_role.custom_roles_bucket_sad_viewer_lodged.id
  member = "serviceAccount:${google_service_account.sad_viewer_lodged.email}"
}
resource "google_storage_bucket_iam_member" "sad_creator_lodged" {
  bucket = google_storage_bucket.sad-bucket-lodged.id
  role   = google_project_iam_custom_role.custom_roles_bucket_sad_creator_lodged.id
  member = "serviceAccount:${google_service_account.sad_creator_lodged.email}"
}

resource "google_service_account_iam_binding" "credit-card-vault-sad-viewer-lodged" {
  service_account_id = google_service_account.sad_viewer_lodged.id
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project}.svc.id.goog[lodged-card-vault/lodged-card-vault-sad-viewer]",
  ]
}

resource "google_service_account_iam_binding" "credit-card-vault-sad-creator-lodged" {
  service_account_id = google_service_account.sad_creator_lodged.id
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project}.svc.id.goog[lodged-card-vault/lodged-card-vault-sad-creator]",
  ]
}


module "kms_sad_lodged" {
  source  = "./../iam/project_iam"
  project = google_project.sad_lodged.project_id
  mode    = "additive"
  bindings = {
    "${google_project_iam_custom_role.custom_roles_sad_encrypt_lodged.id}" = [
      "serviceAccount:${google_service_account.sad_creator_lodged.email}"
    ]
    "${google_project_iam_custom_role.custom_roles_sad_decrypt_lodged.id}" = [
      "serviceAccount:${google_service_account.sad_viewer_lodged.email}"
    ]
  }
}
module "kms_chd_lodged" {
  source  = "./../iam/project_iam"
  project = google_project.chd_lodged.project_id
  mode    = "additive"
  bindings = {
    "${google_project_iam_custom_role.custom_roles_chd_encrypt_lodged.id}" = [
      "serviceAccount:${google_service_account.chd_creator_lodged.email}"
    ]
    "${google_project_iam_custom_role.custom_roles_chd_decrypt_lodged.id}" = [
      "serviceAccount:${google_service_account.chd_viewer_lodged.email}"
    ]
  }
}

