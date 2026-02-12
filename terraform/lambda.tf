resource "aws_lambda_function" "data_processor" {
  function_name = "data_processor_lambda"
  runtime       = "python3.9"
  handler       = "processor.lambda_handler"
  role          = aws_iam_role.lambda_role.arn
  filename      = "../lambda/processor.zip"
}

resource "aws_lambda_function" "daily_report" {
  function_name = "daily_report_lambda"
  runtime       = "python3.9"
  handler       = "report.lambda_handler"
  role          = aws_iam_role.lambda_role.arn
  filename      = "../lambda/report.zip"
}