template "#{node[:arcadia][:php][:conf_path]}/conf.d/arcadia.ini" do
  source 'php/conf.d/arcadia.ini.erb'
  owner node[:user][:name]
  group 'admin'
  mode 00644
end

git "#{node[:arcadia][:project_path]}/contrib/WordPress-Coding-Standards" do
  repository 'https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git'
  user node[:user][:name]
  group node[:user][:group]
  action :sync
end

git "#{node[:arcadia][:project_path]}/php-coding-standards" do
  repository 'git@github.com:makotokw/php-coding-standards.git'
  user node[:user][:name]
  group node[:user][:group]
  action :sync
end

bash "install phpcs" do
  cwd node[:user][:home]
  group node[:user][:group]
  code <<-EOH
    composer global require 'squizlabs/php_codesniffer=*'
    chown -R #{node[:user][:name]}:#{node[:user][:group]} #{node[:user][:home]}/.composer
    phpcs --config-set installed_paths #{node[:arcadia][:project_path]}/contrib/WordPress-Coding-Standards,#{node[:arcadia][:project_path]}/php-coding-standards
  EOH
  environment 'HOME' => node[:user][:home]
end
