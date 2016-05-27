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

# pip install requirements
file node[:tilequeue][:pip_requirements_location] do
  content node[:tilequeue][:pip_requirements].join("\n")
end
python_pip "-U -r #{node[:tilequeue][:pip_requirements_location]}"

git node[:tilequeue][:vector_datasource][:path] do
  action :sync
  repository node[:tilequeue][:vector_datasource][:repository]
  revision node[:tilequeue][:revision][:vector_datasource]
  notifies :run, 'bash[vectordatasource_install]', :immediately
end

bash 'vectordatasource_install' do
  cwd node[:tilequeue][:vector_datasource][:path]
  code 'python setup.py install'
  action :nothing
end
