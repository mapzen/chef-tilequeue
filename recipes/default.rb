#
# Cookbook Name:: tilequeue
# Recipe:: default
#
# Copyright 2014, Mapzen

%w(
  apt
  git
  python::package
  tilestache::default
  tilequeue::groundwork
  tilequeue::install
).each do |r|
  include_recipe r
end
