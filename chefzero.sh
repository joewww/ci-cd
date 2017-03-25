#!/bin/sh

# Use chef-zero to converge local environment

cd /tmp/

# Ubuntu
#curl -o"chef.deb" https://packages.chef.io/files/stable/chef/12.19.36/ubuntu/16.04/chef_12.19.36-1_i386.deb

# RHEL
curl -o"chef.rpm" https://packages.chef.io/files/stable/chef/12.19.36/el/7/chef-12.19.36-1.el7.x86_64.rpm

#sudo dpkg -i chef.deb
sudo yum install chef.rpm -y

cd /tmp/ci-cd/ && chef-client -z -o base | tee /tmp/chefrun.log
