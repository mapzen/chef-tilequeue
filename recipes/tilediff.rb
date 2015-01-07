#
# Cookbook Name:: tilequeue
# Recipe:: tilediff
#

package 'redis-tools'

include_recipe 'tilequeue'

template node[:tilequeue][:tilediff][:script][:path] do
  source 'tilequeue-tilediff.sh.erb'
  mode 0755
end

cron 'tilequeue diff' do
  minute  node[:tilequeue][:tilediff][:cron][:minute]
  hour    node[:tilequeue][:tilediff][:cron][:hour]
  day     node[:tilequeue][:tilediff][:cron][:day]
  user    node[:tilequeue][:tilediff][:cron][:user]
  command "#{node[:tilequeue][:tilediff][:script][:path]} >>#{node[:tilequeue][:tilediff][:script][:output]} 2>&1"
  only_if { node[:tilequeue][:tilediff][:cron][:enabled] == true }
end
