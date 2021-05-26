resource "aws_sqs_queue" "users-register-email" {
  name = "${var.environment}-users-register-queue"
  redrive_policy = jsonencode({
    deadLetterTargetArn = "${aws_sqs_queue.users-register-email_dlq.arn}"
    maxReceiveCount = 3
  })
}

resource "aws_sqs_queue" "users-register-email_dlq" {
  name = "${var.environment}-users-register-queue-dlq"
}