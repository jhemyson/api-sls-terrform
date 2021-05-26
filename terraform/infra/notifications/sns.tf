resource "aws_sns_topic" "notifications" {
  name = "${var.environment}-users-register-notifications"
}

resource "aws_ssm_parameter" "notifications_topic" {
  name = "${var.environment}-users-register-notifications-topic"
  type = "String"
  value = "${aws_sns_topic.notifications.arn}"
}

output "notifications_topic_arn" {
  value = "${aws_sns_topic.notifications.arn}"
}