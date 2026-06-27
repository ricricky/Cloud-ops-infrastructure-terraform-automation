terraform {
  backend "s3" {
    bucket         = "sahil-bucket-202020"
    key            = "AWS_TERRAFORM_PART2/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "tf_locks" # use_lockfile in future
  }
}