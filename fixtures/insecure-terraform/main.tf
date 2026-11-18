# Scanner-only examples. Do not initialize, plan, or apply this directory.
# These deliberately weak settings are intended to produce IaC findings.

terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "unrestricted_ingress" {
  name        = "scanner-fixture-open-ingress"
  description = "Intentionally allows inbound traffic from any IPv4 address"

  ingress {
    description = "Intentionally unrestricted TCP ingress"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "public_unencrypted" {
  identifier             = "scanner-fixture-public-db"
  engine                 = "postgres"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  username               = "demo"
  password               = "not-a-real-password-for-scanning"
  publicly_accessible    = true
  storage_encrypted      = false
  skip_final_snapshot    = true
}

resource "aws_ebs_volume" "unencrypted" {
  availability_zone = "us-east-1a"
  size              = 1
  encrypted         = false
}

resource "aws_iam_policy" "wildcard_permissions" {
  name        = "scanner-fixture-wildcard-policy"
  description = "Intentionally grants every action on every resource"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = "*"
      Resource = "*"
    }]
  })
}
