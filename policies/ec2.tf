# need to create Conditions in the policies for IAM 
# understand the policy details. 
# need to add output values

data "aws_iam_policy_document" "ec2_read" {
# source_policy_documents = [[file("${path.root}./policies/ec2/ec2-read.json")]]
 source_policy_documents = [file("${path.root}/policies/ec2/ec2-read.json")]

                    
}

data "aws_iam_policy_document" "ec2_write" {
source_policy_documents = [file("${path.root}/policies/ec2/ec2-write.json")]
}

data "aws_iam_policy_document" "ec2_run" {
  source_policy_documents = [file("${path.root}/policies/ec2/ec2-run.json")]
}

data "aws_iam_policy_document" "ec2_operate" {
  source_policy_documents = [file("${path.root}/policies/ec2/ec2-operate.json")]
}



resource "aws_iam_policy" "ec2_read" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-ec2-read"
  description = "The ec2 read policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.ec2_read.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "ec2_write" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-ec2-write"
  description = "The ec2 write policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.ec2_write.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}



resource "aws_iam_policy" "ec2_run" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-ec2-run"
  description = "The ec2 run policy, to be used in permission boundaries for supporting runtime IAM role restrictions for ec2"
  policy      = data.aws_iam_policy_document.ec2_run.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "ec2_operate" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-ec2-operate"
  description = "The ec2 operate policy, to be used by humans for supporting ec2 deployments"
  policy      = data.aws_iam_policy_document.ec2_operate.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}


# OUTPUT Why there is try and count use 



output "ec2_run_policy_arn" {
  value = try(aws_iam_policy.ec2_run[0].arn, null)
}

output "ec2_operate_policy_arn" {
  value = try(aws_iam_policy.ec2_operate[0].arn, null)
}


output "ec2_read_policy_arn" {
  value = try(aws_iam_policy.ec2_read[0].arn, null)
}

output "ec2_write_policy_arn" {
  value = try(aws_iam_policy.ec2_write[0].arn, null)
}


output "ec2_operate_policy_json" {
  value = data.aws_iam_policy_document.ec2_operate.json
}

output "ec2_read_policy_json" {
  value = data.aws_iam_policy_document.ec2_read.json
}

output "ec2_write_policy_json" {
  value = data.aws_iam_policy_document.ec2_write.json
}

output "ec2_run_policy_json" {
  value = data.aws_iam_policy_document.ec2_run.json
}