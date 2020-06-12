#
# Cookbook:: system
# Recipe:: hosts
#
# Copyright:: 2020, The Authors, All Rights Reserved.

template "/etc/hosts" do
  source "hosts.erb"
  owner "root"
  group "root"
  mode 0644
  action :create
  variables({
    :hostname  => node['hostname'],
    :fqdn      => node['fqdn'],
    :ipaddress => node['ipaddress']
  })
end
