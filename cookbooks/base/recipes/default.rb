#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'vim'
package 'jq'
package 'openssh-server'

service 'sshd' do
  action [:enable, :start]
  supports :status => true, :start => true, :stop => true, :restart => true
end
