module "users" {
  source = "../../infra/users"
  environment = "${var.environment}"
  read_capacity = 1
  write_capacity = 1
}