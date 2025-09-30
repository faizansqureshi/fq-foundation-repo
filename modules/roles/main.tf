# Provides an IAM role.
# what is path ?
# what is force detection and max session
resource "aws_iam_role" "role" {
  name        = var.role_name
  path        = var.role_path
  description = var.role_description

  assume_role_policy    = var.role_assume_policy
  permissions_boundary  = var.role_permissions_boundary
  force_detach_policies = var.role_force_detach_policies
  max_session_duration  = var.role_max_session_duration

  tags = merge({ "Name" = upper(var.role_name), "ManagedBy" = "Terraform", "Creation Date" = timestamp() }, var.tags)
  lifecycle {
    ignore_changes = [
      tags["Creation Date"]
    ]
  }
}

resource "aws_iam_role_policy_attachments_exclusive" "attachments" {
  role_name   = aws_iam_role.role.name
  policy_arns = var.role_managed_policy_arns
}