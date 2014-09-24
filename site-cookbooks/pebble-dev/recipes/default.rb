#
# Cookbook Name:: pebble-dev
# Recipe:: default
#
# Copyright 2014, Makoto Kawasaki
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package 'python'
package 'freetype'

directory node[:pebble_dev][:dev_root] do
  owner node[:pebble_dev][:user]
  group node[:pebble_dev][:group]
  mode 00755
end

# need to login for download sdk...
# remote_file "#{Chef::Config['file_cache_path']}/#{node[:pebble_dev][:sdk_dirname]}.tar.gz" do
#   source node[:pebble_dev][:sdk_url]
#   owner node[:pebble_dev][:user]
#   group node[:pebble_dev][:group]
#   mode 00644
#   not_if { ::Dir.exist?(node[:pebble_dev][:sdk_path]) }
# end

raise("Donwload #{node[:pebble_dev][:sdk_dirname]}.tar.gz from #{node[:pebble_dev][:sdk_url]}") unless ::File.exist?(node[:pebble_dev][:sdk_archive_file])

bash "extract #{node[:pebble_dev][:sdk_dirname]}.tar.gz" do
  cwd node[:pebble_dev][:dev_root]
  code <<-EOH
    su #{node[:pebble_dev][:user]}
    cd #{node[:pebble_dev][:dev_root]}
    tar -zxf #{node[:pebble_dev][:sdk_archive_file]}
  EOH
  only_if { !::Dir.exist?(node[:pebble_dev][:sdk_path]) && ::File.exist?(node[:pebble_dev][:sdk_archive_file]) }
end

remote_file "#{Chef::Config['file_cache_path']}/arm-cs-tools-static.tar.gz" do
  source node[:pebble_dev][:arm_toolchain_url]
  owner node[:pebble_dev][:user]
  group node[:pebble_dev][:group]
  mode 00644
  only_if { ::Dir.exist?(node[:pebble_dev][:sdk_path]) }
end
bash "extract arm-cs-tools-static.tar.gz" do
  cwd node[:pebble_dev][:sdk_path]
  code <<-EOH
    su #{node[:pebble_dev][:user]}
    tar -zxf #{Chef::Config['file_cache_path']}/arm-cs-tools-static.tar.gz
  EOH
  only_if { ::Dir.exist?(node[:pebble_dev][:sdk_path]) }
end

bash "install python package for PebbleSDK" do
  cwd node[:pebble_dev][:sdk_path]
  code <<-EOH
    su #{node[:pebble_dev][:user]}
    pip install --upgrade setuptools
    pip install --upgrade pip
    pip install --upgrade virtualenv
    virtualenv --no-site-packages .env
    source .env/bin/activate
    CFLAGS="" pip install -r #{node[:pebble_dev][:sdk_path]}/requirements.txt --upgrade
    deactivate
  EOH
  only_if { ::Dir.exist?(node[:pebble_dev][:sdk_path]) }
end

bash "fixed permission PebbleSDK" do
  cwd node[:pebble_dev][:sdk_path]
  code <<-EOH
    chown -R #{node[:pebble_dev][:user]}:#{node[:pebble_dev][:group]} #{node[:pebble_dev][:sdk_path]}
  EOH
  only_if { ::Dir.exist?(node[:pebble_dev][:sdk_path]) }
end
