case node[:platform_family]
when 'mac_os_x'
  echo_user = Mixlib::ShellOut.new('whoami')
  echo_user.run_command
  default[:pebble_dev][:user] = echo_user.stdout.strip
  default[:pebble_dev][:group] = 'staff'
  default[:pebble_dev][:user_home] = "/Users/#{node[:pebble_dev][:user]}"
end

default[:pebble_dev][:emulator][:platforms] = %w{basalt}
