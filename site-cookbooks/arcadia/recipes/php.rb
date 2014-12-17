# php.ini
template "#{node[:arcadia][:php][:conf_path]}/conf.d/arcadia.ini" do
  source 'php/conf.d/arcadia.ini.erb'
  owner node[:user][:name]
  group 'admin'
  mode 00644
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
