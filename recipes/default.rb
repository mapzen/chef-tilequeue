#
# Cookbook Name:: tilequeue
# Recipe:: default
#

%w(
  apt::default
  git::default
  python::package
  tilequeue::install
).each do |r|
  include_recipe r
end
