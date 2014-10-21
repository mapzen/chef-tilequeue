#
# Cookbook Name:: tilequeue
# Recipe:: default
#

%w(
  apt::default
  git::default
  python::package
  tilestache::default
  tilequeue::groundwork
  tilequeue::install
).each do |r|
  include_recipe r
end
