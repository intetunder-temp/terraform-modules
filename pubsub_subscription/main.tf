resource "google_pubsub_topic" "pubsub_topic" {
  name    = var.topic
  project = var.project_id
}

resource "google_pubsub_subscription" "push_subscriptions" {
  count   = length(var.push_subscriptions)
  project = lookup(var.push_subscriptions[count.index], "project")
  name    = lookup(var.push_subscriptions[count.index], "name")
  topic   = google_pubsub_topic.pubsub_topic.*.name[count.index]

  ack_deadline_seconds = var.push_subscriptions[count.index]["ack_deadline_seconds"]

  expiration_policy {}


  push_config {
    push_endpoint = var.push_subscriptions[count.index]["push_endpoint"]

    attributes = {
      x-goog-version = lookup(var.push_subscriptions[count.index], "x-goog-version", "v1")
    }
  }


  labels = merge(
    var.push_subscriptions_labels["all"],
    var.push_subscriptions_labels[var.push_subscriptions[count.index]["name"]],
  )
  depends_on = [google_pubsub_topic.pubsub_topic]
}



resource "google_pubsub_subscription" "pull_subscriptions" {
  count                = length(var.pull_subscriptions)
  name                 = var.pull_subscriptions[count.index].name
  topic                = google_pubsub_topic.pubsub_topic.*.name[count.index]
  project              = var.project_id
  ack_deadline_seconds = var.pull_subscriptions[count.index]["ack_deadline_seconds"]

  depends_on = [google_pubsub_topic.pubsub_topic]
}
