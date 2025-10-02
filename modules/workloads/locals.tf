locals {
  policies_arns = [for item in var.policies:"arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/${item}"      ]
}

