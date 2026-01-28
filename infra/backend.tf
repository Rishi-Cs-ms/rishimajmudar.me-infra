terraform {
  backend "s3" {
    bucket         = "rishimajmudar-tf-state"
    key            = "portfolio/terraform.tfstate"
    region         = "ca-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}