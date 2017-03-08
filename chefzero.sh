#!/bin/sh

# Use chef-zero to converge local environment

curl -o\"chef.deb\" https://packages.chef.io/files/stable/chef/12.19.36/ubuntu/16.04/chef_12.19.36-1_i386.deb

sudo dpkg -i chef.deb

cd /tmp/ci-cd/ && chef-client -z -o base | tee /tmp/chefrun.log
