# need to create Conditions in the policies for IAM 
# understand the policy details. 
# need to add output values

data "aws_iam_policy_document" "ec2_read" {
  source_policy_documents = [file("${path.module}/ec2/ec2-read.json")]
                    
}

data "aws_iam_policy_document" "ec2_write_only" {
  source_policy_documents = [file("${path.module}/ec2/ec2-write.json")]
}

data "aws_iam_policy_document" "ec2_write" {
  source_policy_documents = [
    data.aws_iam_policy_document.ec2_read.json,
    data.aws_iam_policy_document.ec2_write_only.json,
  ]
}

data "aws_iam_policy_document" "ec2_run" {
  source_policy_documents = [[file("${path.module}/ec2/ec2-run.json")]  ]
}

data "aws_iam_policy_document" "ec2_operate" {
  source_policy_documents = [[file("${path.module}/ec2/ec2-operate.json")]  ]
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