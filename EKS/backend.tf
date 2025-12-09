terraform {
  backend "s3" {
    bucket         = "tf-state-danit-devops-9"
    key            = "eks/terraform.tfstate"
    encrypt        = true
    #dynamodb_table = "lock-tf-eks"
    # dynamo key LockID
    # Params tekan from -backend-config when terraform init
    #region = 
    #profile = 
  }
}


