resource "aws_sns_topic" "chats_messages" {
  name = local.chat_topic_name

  tags = {
    name = "${local.project_name}-${local.chat_topic_name}"
  }
}