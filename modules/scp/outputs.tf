output "policy_id" {
  description = "ID of the created Organizations policy"
  value       = aws_organizations_policy.this.id
}

output "policy_arn" {
  description = "ARN of the created Organizations policy"
  value       = aws_organizations_policy.this.arn
}

output "attachment_count" {
  description = "Number of targets the policy was attached to"
  value       = length(var.targets)
}
