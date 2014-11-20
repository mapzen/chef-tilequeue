#
# Cookbook Name:: tilequeue
# Recipe:: seed
#

# run a seed process

include_recipe 'tilequeue'

bin = node[:tilequeue][:bin_path]
cfg = "#{node[:tilequeue][:cfg_path]}/#{node[:tilequeue][:cfg_file]}"
log = node[:tilequeue][:seed][:log]

bash 'tilequeue-seed-cmd' do
  code "nohup #{bin} seed --config #{cfg} 2>&1 >#{log}"
end
