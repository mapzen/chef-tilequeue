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
  default_logger  false
  sv_timeout      node[:tilequeue][:runit][:timeout]
end

# Restarts can hang for a while, and when runit times out we end up
# getting setup failures.
# Here we'll have a script that first tries to restart, and on timeout
# it will force kill all processes.
# Runit will detect that the process died, and will start it again for us.
template node[:tilequeue][:force_restart][:script] do
  source 'tilequeue-process-force-restart.sh.erb'
  mode   0755
end

execute 'tilequeue-force-restart' do
  action     :nothing
  command    node[:tilequeue][:force_restart][:script]
  subscribes :run, "python_pip[-U -r #{node[:tilequeue][:pip_requirements_location]}]", :delayed
end
