#
# Cookbook Name:: tilequeue
# Recipe:: processor
#

# supervise the tilequeue process with runit

include_recipe 'tilequeue'

include_recipe 'runit::default'

runit_service 'tilequeue' do
  action          [:enable, :start]
  log             true
  default_logger  true
  sv_timeout      30
  subscribes      :restart, "python_pip[-U -r #{node[:tilequeue][:pip_requirements_location]}]", :delayed
end
