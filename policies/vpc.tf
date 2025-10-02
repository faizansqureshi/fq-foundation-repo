
# need to create Conditions in the policies for VPC
# understand the policy details. 
# need to add output values


data "aws_iam_policy_document" "vpc_read" {
  source_policy_documents = [file("${path.module}/vpc/vpc-read.json")]
                   
}

data "aws_iam_policy_document" "vpc_operate" {
  source_policy_documents = [file("${path.module}/vpc/vpc-operate.json")]
                   
}

data "aws_iam_policy_document" "vpc_run" {
  source_policy_documents = [file("${path.module}/vpc/vpc-run.json")]
                   
}

data "aws_iam_policy_document" "vpc_write" {
  source_policy_documents = [file("${path.module}/vpc/vpc-write.json")]
                   
}



resource "aws_iam_policy" "vpc_read" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-vpc-read"
  description = "The vpc read policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.vpc_read.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "vpc_write" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-vpc-write"
  description = "The vpc write policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.vpc_write.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}



resource "aws_iam_policy" "vpc_run" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-vpc-run"
  description = "The vpc run policy, to be used in permission boundaries for supporting runtime IAM role restrictions for vpc"
  policy      = data.aws_iam_policy_document.vpc_run.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "vpc_operate" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-vpc-operate"
  description = "The vpc operate policy, to be used by humans for supporting vpc deployments"
  policy      = data.aws_iam_policy_document.vpc_operate.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

#output

output "vpc_read_policy_arn" {
  value = try(aws_iam_policy.vpc_read[0].arn, null)
}

output "vpc_write_policy_arn" {
  value = try(aws_iam_policy.vpc_write[0].arn, null)
}

output "vpc_run_policy_arn" {
  value = try(aws_iam_policy.vpc_run[0].arn, null)
}

output "vpc_operate_policy_arn" {
  value = try(aws_iam_policy.vpc_operate[0].arn, null)
}



output "vpc_read_policy_json" {
  value = data.aws_iam_policy_document.vpc_read.json
}

output "vpc_write_policy_json" {
  value = data.aws_iam_policy_document.vpc_write.json
}

output "vpc_run_policy_json" {
  value = data.aws_iam_policy_document.vpc_run.json
}

output "vpc_operate_policy_json" {
  value = data.aws_iam_policy_document.vpc_operate.json
}