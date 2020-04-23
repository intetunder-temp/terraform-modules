resource "google_project_iam_binding" "container_cluster_viewer" {
  project = module.project.project_id
  role    = "roles/container.clusterViewer"
  members = [
    "group:developers@darknet.fyi",
    "group:devops@darknet.fyi"
  ]
}
##### IAP Web access to Viewer Ingress ####
resource "google_iap_web_iam_binding" "viewer-iap-ingress-iam" {
  project = module.project.project_id
  role    = "roles/iap.httpsResourceAccessor"
  members = [
    "group:devops@darknet.fyi",
    "group:developers@darknet.fyi",
    "group:csa@darknet.fyi",
  ]
}
module "project-iam-bindings-clean-dev" {
  source  = "./modules/iam/project_iam"
  project = module.project.project_id
  mode    = "additive"
  bindings = {
    "roles/cloudtrace.agent" = [
      "serviceAccount:tf-ccv-sad-creator@${module.project.project_id}.iam.gserviceaccount.com",
      "serviceAccount:tf-ccv-chd-creator@${module.project.project_id}.iam.gserviceaccount.com",
      "serviceAccount:tf-ccv-sad-viewer@${module.project.project_id}.iam.gserviceaccount.com",
      "serviceAccount:tf-ccv-chd-viewer@${module.project.project_id}.iam.gserviceaccount.com",
      "serviceAccount:tf-ccv-sad-deleter@${module.project.project_id}.iam.gserviceaccount.com",
      "serviceAccount:tf-ccv-chd-deleter@${module.project.project_id}.iam.gserviceaccount.com",
      "serviceAccount:tf-ccg-collector@${module.project.project_id}.iam.gserviceaccount.com",
      "serviceAccount:tf-ccg-deleter@${module.project.project_id}.iam.gserviceaccount.com",
      "serviceAccount:tf-ccg-proxy@${module.project.project_id}.iam.gserviceaccount.com",
      "serviceAccount:tf-ccg-viewer@${module.project.project_id}.iam.gserviceaccount.com",
      "serviceAccount:tf-ccl-eager-beaver@${module.project.project_id}.iam.gserviceaccount.com",
      "serviceAccount:tf-ccl-lumberjack@${module.project.project_id}.iam.gserviceaccount.com",
    ]
    "roles/monitoring.viewer" = [
      "group:developers@darknet.fyi",
      "group:devops@darknet.fyi"
    ]
    "roles/logging.viewer" = [
      "group:developers@darknet.fyi",
      "group:devops@darknet.fyi"
    ]
    "roles/cloudtrace.user" = [
      "group:developers@darknet.fyi",
      "group:devops@darknet.fyi"
    ]
    "roles/owner" = [
      "group:devops@darknet.fyi"
    ]

  }
}
