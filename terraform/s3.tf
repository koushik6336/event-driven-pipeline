resource "aws_s3_bucket" "raw_data" {
  bucket = "event-driven-raw-data-demo-123"
}

resource "aws_s3_bucket" "processed_data" {
  bucket = "event-driven-processed-data-demo-123"
}

resource "aws_s3_bucket" "reports" {
  bucket = "event-driven-raw-data-koushik"
}