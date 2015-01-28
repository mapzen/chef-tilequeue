#
# Cookbook Name:: tilequeue
# Recipe:: user
#

# create tilequeue user
user_account node[:tilequeue][:user][:user] do
  manage_home true
  create_group true
  home "/home/#{node[:tilequeue][:user][:user]}"
end
