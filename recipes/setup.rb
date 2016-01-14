#
# Cookbook Name:: tilequeue
# Recipe:: setup
#

%w(
  apt::default
  git::default
  python::default
).each do |r|
  include_recipe r
end

# dev packages required by python packages
%w(
  python-dev
  libgeos-dev
  libpq-dev
  python-pip
  python-pil
  libjpeg-dev
).each do |p|
  package p
end

user_account node[:tilequeue][:user][:user] do
  manage_home true
  create_group node[:tilequeue][:user][:create_group]
  home node[:tilequeue][:user][:home]
  only_if { node[:tilequeue][:user][:enabled] }
end

directory node[:tilequeue][:cfg_path] do
  action :create
  recursive true
end
