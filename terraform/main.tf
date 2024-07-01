provider "aws" {
    region = "eu-west-1"
  
}

resource "aws_iam_group" "developers_group" {
  name = var.group_name
}

resource "aws_iam_user" "developer_1" {
  name = var.user_name_1
}

resource "aws_iam_user" "developer_2" {
  name = var.user_name_2
}

resource "aws_iam_group_membership" "developers_membership" {
  name = "developers-membership"
  group = aws_iam_group.developers_group.name
  users = [
    aws_iam_user.developer_1.name,
    aws_iam_user.developer_2.name,
  ]
}