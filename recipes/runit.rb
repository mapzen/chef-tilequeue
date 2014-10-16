#
# Cookbook Name:: tilequeue
# Recipe:: runit
#
# Copyright 2014, Mapzen

# supervise the tilequeue process with runit

include_recipe 'runit'

runit_service 'tilequeue' do
  action          [:enable, :start]
  log             true
  default_logger  true
  sv_timeout      30
end
