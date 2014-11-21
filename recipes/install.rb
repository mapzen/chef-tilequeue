#
# Cookbook Name:: tilequeue
# Recipe:: install
#

# tilequeue user
user_account node[:tilequeue][:user][:user] do
  manage_home true
  create_group true
  home "/home/#{node[:tilequeue][:user][:user]}"
end

# dev packages required by python packages
%w(
  python-dev
  libgeos-dev
  libpq-dev
  python-pip
  python-pil
).each do |p|
  package p
end

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

# create config files needed for tilequeue
tilequeue_config_file_template_mapping = {
  'config.yaml' => 'tilequeue-config.yaml.erb',
  'logging.conf' => 'tilequeue-logging.conf.erb'
}
tilequeue_config_file_template_mapping.each do |filename, templatename|
  template "#{node[:tilequeue][:cfg_path]}/#{filename}" do
    source templatename
  end
end

include_recipe 'tilequeue::install_pip_requirements' if node[:tilequeue][:install_method] == 'pip_requirements'
include_recipe 'tilequeue::install_source'           if node[:tilequeue][:install_method] == 'source'
