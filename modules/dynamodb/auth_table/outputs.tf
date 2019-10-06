output "table_name" {
  value = "${aws_dynamodb_table.auth_table.name}"
}

output "id" {
  value = "${aws_dynamodb_table.auth_table.id}"
}

output "arn" {
  value = "${aws_dynamodb_table.auth_table.arn}"
}
