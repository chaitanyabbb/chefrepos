#
# Cookbook:: system
# Recipe:: resolv
#
# Copyright:: 2020, The Authors, All Rights Reserved.

template "/etc/resolv.conf" do
  source "resolv.erb"
  owner "root"
  group "root"
  mode 0644
  action :create
end

