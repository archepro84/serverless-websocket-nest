data "dotenv" "dev_config" {
  filename = "../.env"
}

locals {
  env                   = data.dotenv.dev_config.env
  project_name          = try(local.env.PROJECT_NAME, "serverless-websocket-nest")
  region                = try(local.env.REGION, "ap-northeast-2")
  users_table_name      = try(local.env.USERS_TABLE, "users_table_name")
  chat_rooms_table_name = try(local.env.CHAT_ROOMS_TABLE, "chat_rooms_table_name")
  chats_table_name      = try(local.env.CHATS_TABLE, "chats_table_name")
}

output "dotenv" {
  value = local.env
}