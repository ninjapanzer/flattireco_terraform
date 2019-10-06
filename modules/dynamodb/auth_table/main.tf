resource "aws_dynamodb_table" "auth_table" {
  name           = "authTable"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "Provider"

  attribute {
    name = "Provider"
    type = "S"
  }

  tags = {
    Name        = "auth-table-1"
    Environment = "dev"
  }
}
