#
# Cookbook:: system
# Recipe:: shells
#
# Copyright:: 2020, The Authors, All Rights Reserved.


template "/etc/shells" do
  source "shells.erb"
  owner "root"
  group "root"
  mode 0644
  action :create
end
