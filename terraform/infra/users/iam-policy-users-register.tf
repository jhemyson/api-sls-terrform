resource "aws_iam_policy" "users_register_policy" {
  name = "${var.environment}-users-register-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "dynamodb:PutItem",
        ]
        Effect   = "Allow"
        Resource = "${aws_dynamodb_table.users.arn}"
      },
      {
        Action: [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect: "Allow",
        Resource: "*"
      },
      {
        Action: [
          "sns:Publish",
        ],
        Effect: "Allow",
        Resource: "${var.sns_notifications_arn}"
      }
    ]
  })  
}