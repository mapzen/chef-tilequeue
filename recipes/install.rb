#
# Cookbook Name:: tilequeue
# Recipe:: install
#

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

template "#{node[:tilequeue][:cfg_path]}/#{node[:tilequeue][:cfg_file]}" do
  source 'tilequeue-config.yaml.erb'
end

template "#{node[:tilequeue][:cfg_path]}/#{node[:tilequeue][:logging_file]}" do
  source 'tilequeue-logging.conf.erb'
end

git "#{node[:tilequeue][:cfg_path]}/vector-datasource" do
  action :sync
  repository node[:tilequeue][:vector_datasource][:repository]
  revision node[:tilequeue][:vector_datasource][:revision]
end

# generate a pip requirements file for consistent python package
# versions
file node[:tilequeue][:pip_requirements_location] do
  content node[:tilequeue][:pip_requirements].join("\n")
end

# install python packages from requirements file
python_pip "-U -r #{node[:tilequeue][:pip_requirements_location]}"
