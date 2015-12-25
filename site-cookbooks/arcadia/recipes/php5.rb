homebrew_tap 'homebrew/dupes'

homebrew_package node[:arcadia][:php5][:package] do
  options node[:arcadia][:php5][:package_option]
end

node[:arcadia][:php5][:ext_packages].each do |pkg|
  homebrew_package pkg
end

# composer
homebrew_package 'composer'

# php.ini
template "#{node[:arcadia][:php5][:conf_path]}/conf.d/arcadia.ini" do
  source 'php/conf.d/arcadia.ini.erb'
  owner node[:user][:name]
  group 'admin'
  mode 00644
end

# WordPress-Coding-Standards
git "#{node[:arcadia][:project_path]}/contrib/WordPress-Coding-Standards" do
  repository 'git@github.com:WordPress-Coding-Standards/WordPress-Coding-Standards.git'
  user node[:user][:name]
  group node[:user][:group]
  action :sync
end

# Symfony
bash "install symfony" do
  cwd node[:user][:home]
  user node[:user][:name]
  group node[:user][:group]
  code <<-EOH
    curl -LsS http://symfony.com/installer > symfony.phar
    sudo mv symfony.phar /usr/local/bin/symfony
    chmod a+x /usr/local/bin/symfony
  EOH
  environment 'HOME' => node[:user][:home]
end

# php_codesniffer
bash "install phpcs" do
  cwd node[:user][:home]
  user node[:user][:name]
  group node[:user][:group]
  code <<-EOH
    composer global require 'squizlabs/php_codesniffer=*'
    phpcs --config-set installed_paths #{node[:arcadia][:project_path]}/contrib/WordPress-Coding-Standards,#{node[:arcadia][:project_path]}/php-coding-standards
  EOH
  environment 'HOME' => node[:user][:home]
end
