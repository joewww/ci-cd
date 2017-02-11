include_recipe 'base::blockchain-workstation'

# Needed for Mist
package 'libXScrnSaver.i686'

directory '/Blockchain/dogecoin' do
  owner 'dev'
  group 'dev'
  mode '0755'
  action :create
end
