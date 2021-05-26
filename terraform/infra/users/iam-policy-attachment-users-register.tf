resource "aws_iam_policy_attachment" "users_register_policy_attachment" {
    name = "${var.environment}-users-register-attachment"
    roles = ["${aws_iam_role.users_register_iam_role.name}"]
    policy_arn = "${aws_iam_policy.users_register_policy.arn}"
}