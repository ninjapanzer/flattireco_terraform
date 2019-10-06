resource "aws_dynamodb_table" "auth_table" {
  name           = "authTable"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "Provider"
  range_key      = "TokenType"

  attribute {
    name = "Provider"
    type = "S"
  }

  attribute {
    name = "TokenType"
    type = "S"
  }

  tags = {
    Name        = "auth-table-1"
    Environment = "dev"
  }
}
