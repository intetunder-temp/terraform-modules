variable "project_id" {
  type        = string
  description = "The project ID to manage the Pub/Sub resources"
}

variable "topic" {
  type        = string
  description = "The Pub/Sub topic name"
}


variable "pubsub_topic" {
  description = "All variables regarding buckets are expressed here"
  default = [
    {
      project = "default-pool"
      name    = "test"
    },
  ]
}


variable "push_subscriptions" {
  description = "All variables regarding buckets are expressed here"
  default = [
    {
      project              = "default-pool"
      name                 = "test"
      ack_deadline_seconds = 60
    },
  ]
}

variable "pull_subscriptions" {
  description = "All variables regarding buckets are expressed here"
  default = [
    {
      project              = "default-pool"
      name                 = "test"
      ack_deadline_seconds = 60
    },
  ]
}

variable "push_subscriptions_labels" {
  type        = map(map(string))
  description = "Map of maps containing node labels by node-pool name"

  default = {
    all = {}
  }
}

variable "pull_subscriptions_labels" {
  type        = map(map(string))
  description = "Map of maps containing node labels by node-pool name"

  default = {
    all = {}
  }
}



variable "pubsub_topic_labels" {
  type        = map(map(string))
  description = "Map of maps containing node labels by node-pool name"

  default = {
    all = {}
  }
}

