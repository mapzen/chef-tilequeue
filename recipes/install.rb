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

include_recipe 'tilequeue::install_pip_requirements' if node[:tilequeue][:install_method] == 'pip_requirements'
include_recipe 'tilequeue::install_source'           if node[:tilequeue][:install_method] == 'source'
