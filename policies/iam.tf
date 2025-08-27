# need to create Conditions in the policies for IAM 
# need to add the permission boundaries in the policy
# need to add output values
# understand the policy details. 


#DATA SECTION 

data "aws_iam_policy_document" "iam_read" {
  source_policy_documents = [file("${path.module}/iam/iam-read.json")]
                   
}

data "aws_iam_policy_document" "iam_run" {
  source_policy_documents = [file("${path.module}/iam/iam-run.json")]
                   
}

data "aws_iam_policy_document" "iam_write" {
  source_policy_documents = [file("${path.module}/iam/iam-write.json")]
                   
}



#IAM POLCIES


resource "aws_iam_policy" "iam_read" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-iam-read"
  description = "The iam read policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.iam_read.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "iam_run" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-iam-read"
  description = "The iam read policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.iam_run.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}

resource "aws_iam_policy" "iam_write" {
  count       = var.create_policy_resources ? 1 : 0
  name        = "${var.policy_prefix}-iam-read"
  description = "The iam read policy, to be used SDLC tooling in deploy policies"
  policy      = data.aws_iam_policy_document.iam_write.json
  tags        = merge({ "Creation Date" = timestamp(), "Workload" = "foundation" })
  lifecycle {
    ignore_changes = [tags["Creation Date"]]
  }
}