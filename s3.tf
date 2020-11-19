# S3 bucket to hold terraform states of other repos
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.s3_bucket_name
  acl    = "private"

  # To allow rolling back states
  versioning {
    enabled = true
  }

  # To cleanup old states eventually
  lifecycle_rule {
    enabled = true

    noncurrent_version_expiration {
      days = 360
    }
  }

  tags = {
    Name = "Terraform states of GP2GP infrastructure"
  }
}

# S3 bucket to hold terraform state produced in this repo
resource "aws_s3_bucket" "terraform_bootstrap_state" {
  bucket = var.s3_bootstrap_bucket_name
  acl    = "private"

  # To allow rolling back states
  versioning {
    enabled = true
  }

  # To cleanup old states eventually
  lifecycle_rule {
    enabled = true

    noncurrent_version_expiration {
      days = 360
    }
  }

  tags = {
    Name = "Terraform state of the prm-gp2gp-support-infra"
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state_block" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_public_access_block" "terraform_bootstrap_state_block" {
  bucket = aws_s3_bucket.terraform_bootstrap_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

