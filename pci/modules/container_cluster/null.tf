resource "null_resource" "services-dependency" {
  triggers = {
    services = jsonencode(var.services)
  }
}
