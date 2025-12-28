terraform {
  backend "s3" {
    bucket         = "amzn-s3-bucket-storing-statefile"
    key            = "eks-new/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "new-code"
    encrypt        = true
  }
}
