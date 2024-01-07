#provider.tf is to declare which cloud provider we are using to automate the cloud resources.

#we will be using AWS cloud in this provider

provider "aws" {

	region = var.aws_region   #region where you aws resources will be deployed
	access_key = var.aws_access_key
	secret_key = var.aws_secret_key

}
