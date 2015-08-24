#
# Cookbook Name:: tilequeue
# Recipe:: default
#

%w(
  tilequeue::setup
  tilequeue::install
).each do |r|
  include_recipe r
end
