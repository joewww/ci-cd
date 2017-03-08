# CI/CD Pipeline

This project will:

 - Deploy AWS (ec2) instances
 - Using Terraform to orchestrate and manage tfstate remotely
 - chef-zero to manage node configuration
 - GoCD to manage CI pipeline and handle releases


## Usage

- You will need to setup an s3 bucket and an ssh keypair
 - Update terraform/{main.tf, variables.tf} with your own key
 - Update manage.sh with the location of your s3 bucket

manage.sh is used to store the state of your environment remotely in an s3 bucket

 Usage: ./manage.sh <plan/apply/show/destroy>

The testing of the code (using test.sh), orchestration of your ec2 instanes, and
configuration management using chef-zero can be automated with a CI tool such as GoCD:

<img src="https://github.com/joewww/ci-cd/blob/master/docs/pipeline.png" width="561" height="545">

<img src="https://github.com/joewww/ci-cd/blob/master/docs/pipeline-config.png" width="844" height="502">


## Dependencies

- Ubuntu 16.04

- Terraform
 - https://www.terraform.io/downloads.html

- Chef
 - https://downloads.chef.io/chefdk

- GoCD
 - https://www.gocd.io/download/
