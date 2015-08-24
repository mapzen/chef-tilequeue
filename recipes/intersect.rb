#
# Cookbook Name:: tilequeue
# Recipe:: intersect
#

include_recipe 'tilequeue::install'

template node[:tilequeue][:intersect][:script][:path] do
  source 'tilequeue-intersect.sh.erb'
  mode 0755
end

cron 'tilequeue intersect' do
  minute  node[:tilequeue][:intersect][:cron][:minute]
  hour    node[:tilequeue][:intersect][:cron][:hour]
  day     node[:tilequeue][:intersect][:cron][:day]
  user    node[:tilequeue][:intersect][:cron][:user]
  command "#{node[:tilequeue][:intersect][:script][:path]} >>#{node[:tilequeue][:intersect][:script][:output]} 2>&1"
  only_if { node[:tilequeue][:intersect][:cron][:enabled] == true }
end
