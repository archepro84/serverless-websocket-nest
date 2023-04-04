resource "aws_dynamodb_table" "Users" {
  name         = local.users_table_name
  billing_mode = "PAY_PER_REQUEST"

  hash_key  = "PK"
  range_key = "SK"

  attribute {
    name = "PK"
    type = "S"
  }

  attribute {
    name = "SK"
    type = "S"
  }

  tags = {
    Name = "${local.project_name}-${local.users_table_name}"
  }
}

resource "aws_dynamodb_table" "ChatRooms" {
  name         = local.chat_rooms_table_name
  billing_mode = "PAY_PER_REQUEST"

  hash_key  = "PK"
  range_key = "SK"

  attribute {
    name = "PK"
    type = "S"
  }

  attribute {
    name = "SK"
    type = "S"
  }

  tags = {
    Name = "${local.project_name}-${local.chat_rooms_table_name}"
  }
}

resource "aws_dynamodb_table" "Chats" {
  name         = local.chats_table_name
  billing_mode = "PAY_PER_REQUEST"

  hash_key  = "PK"
  range_key = "SK"

  attribute {
    name = "PK"
    type = "S"
  }

  attribute {
    name = "SK"
    type = "S"
  }

  tags = {
    Name = "${local.project_name}-${local.chats_table_name}"
  }
}
