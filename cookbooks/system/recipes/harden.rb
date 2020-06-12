#
# Cookbook:: system
# Recipe:: harden
#
# Copyright:: 2020, The Authors, All Rights Reserved.

if node['system']['hardened']['login_defs'] == true
  ### Configure default login controls (password changes, etc)
  template '/etc/login.defs' do
    owner 'root'
    group 'root'
    mode  '0644'
    source 'login.defs.erb'
    action :create
  end
end

if node['system']['hardened']['shadow'] == true
  ### Lock down shadow and passwd
  file '/etc/shadow' do
    owner 'root'
    group 'root'
    mode  '0000'
  end
end

if node['system']['hardened']['passwd'] == true
  file '/etc/passwd' do
    owner 'root'
    group 'root'
    mode  '0644'
  end
end



if node['system']['hardened']['shell_timeout'] == true
  ### Time out after 900 seconds (15 minutes) of inactivity
  cookbook_file '/etc/profile.d/tmout.sh' do
     owner 'root'
     group 'root'
     mode  '0755'
     source 'tmout.sh'
     action :create
  end
else
  file '/etc/profile.d/tmout.sh' do
    action :delete
    only_if { File.exist? '/etc/profile.d/tmout.sh' }
  end
end

if node['system']['hardened']['traceroute'] == true
  file '/bin/traceroute' do
    owner 'root'
    group 'wheel'
    mode  '4550'
    only_if { ::File.exists?("/bin/traceroute")}
  end
else
  file '/bin/traceroute' do
    owner 'root'
    group 'wheel'
    mode  '4555'
    only_if { ::File.exists?("/bin/traceroute")}
  end
end

if node['system']['hardened']['ping'] == true
  file '/bin/ping' do
    owner 'root'
    group 'wheel'
    mode  '4750'
    only_if { ::File.exists?("/bin/ping")}
  end
else
  file '/bin/ping' do
    owner 'root'
    group 'wheel'
    mode  '4755'
    only_if { ::File.exists?("/bin/ping")}
  end
end

if node['system']['hardened']['mtr'] == true
  file '/sbin/mtr' do
    owner 'root'
    group 'wheel'
    mode  '0750'
    only_if { ::File.exists?("/sbin/mtr")}
  end
else
  file '/sbin/mtr' do
    owner 'root'
    group 'wheel'
    mode  '0755'
    only_if { ::File.exists?("/sbin/mtr")}
  end
end

if node['system']['hardened']['netstat'] == true
  file '/bin/netstat' do
    owner 'root'
    group 'wheel'
    mode  '0750'
    only_if { ::File.exists?("/bin/netstat")}
  end
else
  file '/bin/netstat' do
    owner 'root'
    group 'wheel'
    mode  '0755'
    only_if { ::File.exists?("/bin/netstat")}
  end
end

if node['system']['hardened']['route'] == true
  file '/sbin/route' do
    owner 'root'
    group 'wheel'
    mode  '0750'
    only_if { ::File.exists?("/sbin/route")}
  end
else
  file '/sbin/route' do
    owner 'root'
    group 'wheel'
    mode  '0755'
    only_if { ::File.exists?("/sbin/route")}
  end
end

if node['system']['hardened']['ifconfig'] == true
  file '/sbin/ifconfig' do
    owner 'root'
    group 'wheel'
    mode  '0750'
    only_if { ::File.exists?("/sbin/ifconfig")}
  end
else
  file '/sbin/ifconfig' do
    owner 'root'
    group 'wheel'
    mode  '0755'
    only_if { ::File.exists?("/sbin/ifconfig")}
  end
end

if node['system']['hardened']['ip'] == true
  file '/sbin/ip' do
    owner 'root'
    group 'wheel'
    mode  '0750'
    only_if { ::File.exists?("/sbin/ip")}
  end
else
  file '/sbin/ip' do
    owner 'root'
    group 'wheel'
    mode  '0755'
    only_if { ::File.exists?("/sbin/ip")}
  end
end

##OL6
if node['system']['hardened']['nslookup'] == true
  file '/usr/bin/nslookup' do
    owner 'root'
    group 'wheel'
    mode  '0750'
    only_if { ::File.exists?("/usr/bin/nslookup")}
  end
else
  file '/usr/bin/nslookup' do
    owner 'root'
    group 'wheel'
    mode  '0755'
    only_if { ::File.exists?("/usr/bin/nslookup")}
  end
end

if node['system']['hardened']['dig'] == true
  file '/usr/bin/dig' do
    owner 'root'
    group 'wheel'
    mode  '0750'
    only_if { ::File.exists?("/usr/bin/dig")}
  end
else
  file '/usr/bin/dig' do
    owner 'root'
    group 'wheel'
    mode  '0755'
    only_if { ::File.exists?("/usr/bin/dig")}
  end
end

if node['system']['hardened']['host'] == true
  file '/usr/bin/host' do
    owner 'root'
    group 'wheel'
    mode  '0750'
    only_if { ::File.exists?("/usr/bin/host")}
  end
else
  file '/usr/bin/host' do
    owner 'root'
    group 'wheel'
    mode  '0755'
    only_if { ::File.exists?("/usr/bin/host")}
  end
end

if node['system']['hardened']['wget'] == true
  file '/usr/bin/wget' do
    owner 'root'
    group 'wheel'
    mode  '0750'
    only_if { ::File.exists?("/usr/bin/wget")}
  end
else
  file '/usr/bin/wget' do
    owner 'root'
    group 'wheel'
    mode  '0755'
    only_if { ::File.exists?("/usr/bin/wget")}
  end
end

if node['system']['hardened']['curl'] == true
  file '/usr/bin/curl' do
    owner 'root'
    group 'wheel'
    mode  '0750'
    only_if { ::File.exists?("/usr/bin/curl")}
  end
else
  file '/usr/bin/curl' do
    owner 'root'
    group 'wheel'
    mode  '0755'
    only_if { ::File.exists?("/usr/bin/curl")}
  end
end

if node['system']['hardened']['ntpdate'] == true
  file '/usr/sbin/ntpdate' do
    owner 'root'
    group 'wheel'
    mode  '0750'
    only_if { ::File.exists?("/usr/sbin/ntpdate")}
  end
else
  file '/usr/sbin/ntpdate' do
    owner 'root'
    group 'wheel'
    mode  '0755'
    only_if { ::File.exists?("/usr/sbin/ntpdate")}
  end
end

