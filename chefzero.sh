#!/bin/sh

# Use chef-zero to converge local environment

cd /tmp/

# CentOS
curl -o"chef.rpm" https://packages.chef.io/files/stable/chef/12.19.36/el/7/chef-12.19.36-1.el7.x86_64.rpm

sudo yum install chef.rpm -y

cd /tmp/ci-cd/ && chef-client -z -o base | tee /tmp/chefrun.log
