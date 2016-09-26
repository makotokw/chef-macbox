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

# composer
homebrew_package 'composer'

# WordPress-Coding-Standards
git "#{node[:arcadia][:project_path]}/contrib/WordPress-Coding-Standards" do
  repository 'git@github.com:WordPress-Coding-Standards/WordPress-Coding-Standards.git'
  user node[:user][:name]
  group node[:user][:group]
  action :sync
end

# php_codesniffer
bash "install phpcs" do
  cwd node[:user][:home]
  user node[:user][:name]
  group node[:user][:group]
  code <<-EOH
    composer global require squizlabs/php_codesniffer
    phpcs --config-set installed_paths #{node[:arcadia][:project_path]}/contrib/WordPress-Coding-Standards,#{node[:arcadia][:project_path]}/php-coding-standards
  EOH
  environment 'HOME' => node[:user][:home]
end

# PHP Mess Detector
bash "install phpmd" do
  cwd node[:user][:home]
  user node[:user][:name]
  group node[:user][:group]
  code <<-EOH
    composer global require phpmd/phpmd
  EOH
  environment 'HOME' => node[:user][:home]
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
