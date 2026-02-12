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
resource "aws_lambda_permission" "allow_s3" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.data_processor.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.raw_bucket.arn
}

resource "aws_s3_bucket_notification" "raw_trigger" {
  bucket = aws_s3_bucket.raw_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.data_processor.arn
    events              = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_lambda_permission.allow_s3]
}
