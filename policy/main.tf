# policy/main.tf
resource "google_project_iam_member" "deny_public_ssh" {
  project = var.project_id
  role    = "roles/compute.securityAdmin"
  member  = "user:terraform@your-domain.com"

  condition {
    title       = "no-public-ssh"
    description = "Prevent SSH access from public IP addresses"
    expression  = "!(resource.matchTag('compute.googleapis.com/ssh', 'true'))"
  }
}
