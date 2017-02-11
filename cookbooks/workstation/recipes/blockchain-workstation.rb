
# Ubuntu 16.04

# DevTools for Ethereum

directory '/Blockchain' do
  owner 'dev'
  group 'dev'
  mode '0755'
  action :create
end

user node[:blockchain][:devuser] do
  home '/home/dev'
  shell '/bin/bash'
end
