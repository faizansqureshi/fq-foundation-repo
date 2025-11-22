module "scp" {

  source = "../modules/scp"
    name = var.name
    description = var.description
    content = file("${path.module}/policies/${var.policy_file_name}.json")

    targets = var.targets   
        tags = {
        Environment = "Production"
        ManagedBy   = "Terraform"
        }
    }