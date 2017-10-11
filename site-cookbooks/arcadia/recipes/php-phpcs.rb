# WordPress-Coding-Standards
git "#{node[:arcadia][:project_path]}/contrib/WordPress-Coding-Standards" do
  repository 'git@github.com:WordPress-Coding-Standards/WordPress-Coding-Standards.git'
  user node[:user][:name]
  group node[:user][:group]
  action :sync
end

# WordPress-Coding-Standards
git "#{node[:arcadia][:project_path]}/php-coding-standards" do
  repository 'git@github.com:makotokw/php-coding-standards.git'
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
