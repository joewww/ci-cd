
# Specify the provider and access details
provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "web" {
  instance_type = "m1.small"
  ami           = "${lookup(var.aws_amis, var.aws_region)}"
  key_name	=  "unsecure-key"

  connection {
    user = "ubuntu"
  }

  # This will create 1 instance
  count = 1

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get install git -y",
      "cd /tmp/ && git clone https://github.com/joewww/ci-cd.git",
      "cd /tmp/ci-cd && sudo sh chefzero.sh"
    ]
    connection {
      private_key = "${file(var.key_path)}"
      agent = "false"
    }
  }
}
