#
# Cookbook Name:: tilequeue
# Recipe:: config
#

# all tilequeue config files will end up here
directory node[:tilequeue][:cfg_path] do
  action :create
  recursive true
end

# log file
directory node[:tilequeue][:seed][:log_dir] do
  action :create
  recursive true
end

template "#{node[:tilequeue][:cfg_path]}/#{node[:tilequeue][:cfg_file]}" do
  source 'tilequeue-config.yaml.erb'
end

template "#{node[:tilequeue][:cfg_path]}/#{node[:tilequeue][:logging_file]}" do
  source 'tilequeue-logging.conf.erb'
end
