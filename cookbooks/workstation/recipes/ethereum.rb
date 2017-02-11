include_recipe 'base::blockchain-workstation'

# Needed for Mist
package 'libXScrnSaver.i686'

directory '/Blockchain/Ethereum' do
  owner 'dev'
  group 'dev'
  mode '0755'
  action :create
end

link '/home/dev/.ethereum' do
  to '/Blockchain/Ethereum'
end
