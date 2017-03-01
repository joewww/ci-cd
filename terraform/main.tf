
# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_elb" "web" {
  name = "terraform-example-elb"

  # The same availability zone as our instances
  availability_zones = ["${aws_instance.web.*.availability_zone}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  # The instances are registered automatically
  instances = ["${aws_instance.web.*.id}"]
}

resource "aws_instance" "web" {
  instance_type = "m1.small"
  ami           = "${lookup(var.aws_amis, var.aws_region)}"
  #keyname	=  "unsecure"

  # This will create 5 instances
  count = 5

  # Chef server
  provisioner "chef" {
    server_url = "https:/192.168.1.68/organizations/joew"
    user_name = "joe"
    user_key = "${file("/var/go/unsecure-key.pem")}"
    node_name = "node1"
    run_list = [ "base" ]
    attributes {
      "testapp" {
      user = "ubuntu"
      path = "/var/opt"
      }
    }
  }
}
