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

homebrew_tap 'pebble/pebble-sdk'

# require license agreement in dialogue
# homebrew_package 'pebble/pebble-sdk/pebble-sdk'

# http://developer.getpebble.com/guides/publishing-tools/pebble-tool/
file "#{node[:pebble_dev][:home]}/pebble_dev/NO_TRACKING" do
  owner node[:pebble_dev][:user]
  group node[:pebble_dev][:group]
  mode 00644
  action :touch
end

node[:pebble_dev][:emulator][:platforms].each do |platform|
  bash "install pebble emnulator #{platform}" do
    code <<-EOH
      pebble install --emulator #{platform}
    EOH
    only_if "test -L /usr/local/bin/pebble"
  end
end
