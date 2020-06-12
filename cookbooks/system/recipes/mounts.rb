#
# Cookbook:: system
# Recipe:: mounts
#
# Copyright:: 2020, The Authors, All Rights Reserved.


ruby_block 'Reconfigure /boot to use a label' do
  block do
    ### Reconfigure boot device to use a label if it isn't already
    ### to simplify managing fstab.
    fstab_file = File.open('/etc/fstab')
    fstab_file.each_line do |line|
      next unless line =~/[\/boot]/
      if line =~ /^[UUID]/
        uuid = line.split
        uuid = uuid[0].split('=')
        puts "UUID for boot device is: [#{uuid[1].chomp}]"
        boot = `blkid -U #{uuid[1]} 2>/dev/null`.chomp
        puts "/boot device is: [#{boot}]"
        label = `e2label #{boot} 2>/dev/null`.chomp
        unless label =~ /^LABEL=boot/
          puts "Writing label to [#{boot}]"
          label = `e2label #{boot} boot 2>/dev/null`.chomp
        end
      end
    end
  end
end

ruby_block 'Create directories needed for mount points' do
  block do
    ### We need to make any directories that don't already exist so we can mount them
    ### in-case a cookbook or role needs mount points
    fstab_file = File.open('/etc/fstab')
    fstab_file.each_line do |line|
      next unless line =~ /^[A-z0-9\/]/
      line_arr = line.gsub(/\s+/m, ' ').strip.split(" ")
      if line_arr[1] =~ /[\/]/
        stacked_path = ""
        subdir = line_arr[1].split('/')
        subdir.each do |dir|
          stacked_path = "#{stacked_path}#{dir}/"
          unless Dir.exists?(stacked_path)
            puts "Creating directory: [#{stacked_path}]"
            Dir.mkdir(stacked_path)
          else
            puts "Not creating directory (exists): [#{stacked_path}]"
          end
        end
      end
    end
  end
end

template '/etc/exports' do
  owner 'root'
  group 'root'
  mode   0644
  source 'exports.erb'
  action :create
end

template '/etc/fstab' do
  owner 'root'
  group 'root'
  mode 0644
  source 'fstab.erb'
  action :create
end

bash "Mount all the things" do
  code <<-EOF
    mount -a
  EOF
end
