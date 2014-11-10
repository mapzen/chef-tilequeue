#
# Cookbook Name:: tilequeue
# Recipe:: install_source
#

git node[:tilequeue][:source][:install_dir] do
  action :sync
  repository node[:tilequeue][:source][:repo]
  reference node[:tilequeue][:source][:version]
end

bash 'install-tilequeue-source' do
  code <<-EOH
    cd "#{node[:tilequeue][:source][:install_dir]}"
    python setup.py install
  EOH
end
