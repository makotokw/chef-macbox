#
# Cookbook Name:: arcadia
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

# basic packages
%w{tree pwgen ssh-copy-id wget}.each do |pkg|
  homebrew_package pkg
end

# cask
include_recipe 'arcadia::cask'

# git
include_recipe 'arcadia::git'

# ansible
homebrew_package 'ansible'

# build tools
homebrew_package 'ant'

# for rubygems mysql2
homebrew_package 'mysql'

# gettext
homebrew_package 'gettext'
bash "link gettext" do
  cwd node[:user][:home]
  user node[:user][:name]
  group node[:user][:group]
  code <<-EOH
    brew link --force gettext
  EOH
end

# design tools
homebrew_package 'graphviz'
homebrew_package 'imagemagick'


# project dir
directory node[:arcadia][:project_path] do
  owner node[:user][:name]
  group node[:user][:group]
  mode 00755
  action :create
end

# contrib
directory "#{node[:arcadia][:project_path]}/contrib" do
  owner node[:user][:name]
  group node[:user][:group]
  mode 00755
  action :create
end

# Gemfile for tools
template "#{node[:arcadia][:project_path]}/Gemfile" do
  source 'developer-tools/Gemfile.erb'
  owner node[:user][:name]
  group node[:user][:group]
  mode 00644
end

# make user execute to require root permission
puts <<-EOH
  Put "#{node[:arcadia][:project_path]}/Gemfile"
  Installation: pushd #{node[:arcadia][:project_path]}; bundle install; popd;
EOH
