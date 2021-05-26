module "users" {
  source = "../../infra/users"
  environment = "${var.environment}"
  read_capacity = 1
  write_capacity = 1
  sns_notifications_arn = "${module.notifications.notifications_topic_arn}"
}

module "notifications" {
  source = "../../infra/notifications"
  environment = "${var.environment}"
}