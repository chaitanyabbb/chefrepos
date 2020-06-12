#
# Cookbook:: system
# Recipe:: banner
#
# Copyright:: 2020, The Authors, All Rights Reserved.


cookbook_file '/etc/issue' do
  owner 'root'
  group 'root'
  mode   0755
  source 'issue'
  action :create
end

cookbook_file '/etc/issue.net' do
  owner 'root'
  group 'root'
  mode   0755
  source 'issue.net'
  action :create
end

cookbook_file '/etc/motd' do
  owner 'root'
  group 'root'
  mode   0755
  source 'motd'
  action :create
end
