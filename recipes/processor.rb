#
# Cookbook Name:: tilequeue
# Recipe:: processor
#

# supervise the tilequeue process with runit

include_recipe 'tilequeue::install'

include_recipe 'runit::default'

runit_service 'tilequeue' do
  action          [:enable]
  log             true
  default_logger  true
  sv_timeout      node[:tilequeue][:runit][:timeout]
  subscribes      :restart, "python_pip[-U -r #{node[:tilequeue][:pip_requirements_location]}]", :delayed
end
