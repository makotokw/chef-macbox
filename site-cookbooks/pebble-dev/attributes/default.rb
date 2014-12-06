default[:pebble_dev][:version] = '2.8'
default[:pebble_dev][:sdk_dirname] = "PebbleSDK-#{node[:pebble_dev][:version]}"
default[:pebble_dev][:arm_toolchain_url] = 'http://assets.getpebble.com.s3-website-us-east-1.amazonaws.com/sdk/arm-cs-tools-macos-universal-static.tar.gz'

case node[:platform_family]
when 'mac_os_x'
  echo_user = Mixlib::ShellOut.new('echo $SUDO_USER')
  echo_user.run_command
  default[:pebble_dev][:user] = echo_user.stdout.strip
  default[:pebble_dev][:group] = 'staff'
  default[:pebble_dev][:user_home] = "/Users/#{node[:pebble_dev][:user]}"
  default[:pebble_dev][:sdk_archive_file] = "#{node[:pebble_dev][:user_home]}/Downloads/#{node[:pebble_dev][:sdk_dirname]}.tar.gz"
end

default[:pebble_dev][:dev_root] = "#{node[:pebble_dev][:user_home]}/pebble-dev"
default[:pebble_dev][:sdk_path] = "#{node[:pebble_dev][:dev_root]}/#{node[:pebble_dev][:sdk_dirname]}"
