terraform {
  backend "s3" {
    bucket         = "source-images-bucket-lambda-dec172025"
    key            = "eks/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
