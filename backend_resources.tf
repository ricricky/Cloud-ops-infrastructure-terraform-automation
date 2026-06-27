resource "aws_s3_bucket" "tf_state" {
  bucket = "sahil-bucket-202020"
}
resource "aws_dynamodb_table" "tf_locks" {
  name         = "tf_locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

}