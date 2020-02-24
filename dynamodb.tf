# DynamoDB table to keep the state locks.
resource "aws_dynamodb_table" "terraform_lock" {
  name           = "prm-gp2gp-terraform-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 2
  write_capacity = 2
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform Lock Table"
  }
}
