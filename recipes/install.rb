#
# Cookbook Name:: tilequeue
# Recipe:: install
#

template "#{node[:tilequeue][:cfg_path]}/#{node[:tilequeue][:cfg_file]}" do
  source 'tilequeue-config.yaml.erb'
end

template "#{node[:tilequeue][:cfg_path]}/#{node[:tilequeue][:logging_file]}" do
  source 'tilequeue-logging.conf.erb'
end

git node[:tilequeue][:vector_datasource][:path] do
  action :sync
  repository node[:tilequeue][:vector_datasource][:repository]
  revision node[:tilequeue][:vector_datasource][:revision]
end

# python-dateutil needs to be installed first as a workaround for edtf
# otherwise edtf installation fails
python_pip "-U #{node[:tilequeue][:pip_requirements_dateutil]}"

# pip install requirements
file node[:tilequeue][:pip_requirements_location] do
  content node[:tilequeue][:pip_requirements].join("\n")
end
python_pip "-U -r #{node[:tilequeue][:pip_requirements_location]}"
