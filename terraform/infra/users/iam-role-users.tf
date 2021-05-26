resource "aws_iam_role" "users_register_iam_role" {
  name = "${var.environment}-users-register-iam-role"

    assume_role_policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Sid    = ""
          Principal = {
            Service = "lambda.amazonaws.com"
          }  
        },
      ]
  })
}

resource "aws_ssm_parameter" "users_register_iam_role" {
  name = "${var.environment}-users-register-iam-role"
  type = "String"
  value = "${aws_iam_role.users_register_iam_role.arn}"
}