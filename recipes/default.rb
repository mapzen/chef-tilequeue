#
# Cookbook Name:: tilequeue
# Recipe:: default
#

%w(
  apt::default
  git::default
  python::default
  tilequeue::user
  tilequeue::install
).each do |r|
  include_recipe r
end
