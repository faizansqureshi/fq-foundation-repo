module "scp" {

  source      = "../../modules/scp"
  for_each = var.scps
  name        = each.value.name
  description = each.value.description
  content     = file("${path.module}/policies/${each.value.policy_file_name}.json")

  targets = each.value.targets
  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}
