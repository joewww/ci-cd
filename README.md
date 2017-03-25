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

```bash
 Usage: ./manage.sh <plan/apply/show/destroy>
```

The testing of the code (using test.sh), orchestration of your ec2 instanes, and
configuration management using chef-zero can be automated with a CI tool such as GoCD:

<img src="https://github.com/joewww/ci-cd/blob/master/docs/pipeline.png">

<img src="https://github.com/joewww/ci-cd/blob/master/docs/pipeline-config.png">


## Notes

Terraform has a chef provider available, but you cannot use it natively without a chef server:

https://www.terraform.io/docs/providers/chef/index.html

I did not want to run my own chef server, so I made a hack by using terraform/main.tf
to call chefzero.sh, which then installs chef-client and runs the base cookbook recipe
against the ec2 node.

## Dependencies

* CentOS 7.x
* Terraform 0.8.8
  * https://www.terraform.io/downloads.html
* Chef 12.19
  * https://downloads.chef.io/chefdk
* GoCD
  * https://www.gocd.io/download/
