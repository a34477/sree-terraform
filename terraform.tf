terraform {
  backend "s3" {
    bucket  = "sreebucket"
    key     = "terraform/statefiles/terraform.tfstate"
    region  = "us-east-1"
    profile = "sree"
  }
}
