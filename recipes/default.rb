#
# Cookbook Name:: tilequeue
# Recipe:: default
#

%w(
  apt::default
  git::default
  python::default
  tilequeue::user
  tilequeue::config
  tilequeue::install
).each do |r|
  include_recipe r
end
