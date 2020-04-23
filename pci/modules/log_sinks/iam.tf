resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.audit-logs.name
  role   = "roles/storage.legacyBucketWriter"
  member = "group:cloud-storage-analytics@google.com"
}
