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
    git clone https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards.git .wpcs
    chown -R #{node[:user][:name]}:#{node[:user][:group]} #{node[:user][:home]}/.composer
    chown -R #{node[:user][:name]}:#{node[:user][:group]} #{node[:user][:home]}/.wpcs
    phpcs --config-set installed_paths #{node[:user][:home]}/.wpcs
  EOH
  environment 'HOME' => node[:user][:home]
end
