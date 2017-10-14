homebrew_tap 'homebrew/php'

homebrew_package node[:arcadia][:php7][:package] do
  options node[:arcadia][:php7][:package_option]
end

node[:arcadia][:php7][:ext_packages].each do |pkg|
  homebrew_package pkg
end

# php.ini
template "#{node[:arcadia][:php7][:conf_path]}/conf.d/arcadia.ini" do
  source 'php7/conf.d/arcadia.ini.erb'
  owner node[:user][:name]
  group 'admin'
  mode 00644
end

include_recipe 'arcadia::php-composer'
include_recipe 'arcadia::php-phpcs'
