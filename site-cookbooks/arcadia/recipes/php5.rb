homebrew_tap 'homebrew/php'

homebrew_package node[:arcadia][:php5][:package] do
  options node[:arcadia][:php5][:package_option]
end

node[:arcadia][:php5][:ext_packages].each do |pkg|
  homebrew_package pkg
end

# php.ini
template "#{node[:arcadia][:php5][:conf_path]}/conf.d/arcadia.ini" do
  source 'php5/conf.d/arcadia.ini.erb'
  owner node[:user][:name]
  group 'admin'
  mode 00644
end

include_recipe 'arcadia::php-composer'
include_recipe 'arcadia::php-phpcs'
