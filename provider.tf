#provider.tf is to declare which cloud provider we are using to automate the cloud resources.

#we will be using AWS cloud in this provider

provider "aws" {

	region = var.aws_region   #region where you aws resources will be deployed
	assume_role {
   	 role_arn = "arn:aws:iam::481085503424:role/ec2-jenkins-terrafrom"
 	}
}
