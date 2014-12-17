package 'node'

bash "setup_npm_package" do
  cwd node[:user][:home]
  group node[:user][:group]
  code <<-EOH
    su #{node[:user][:name]}
    npm install -g grunt-cli bower
  EOH
  environment 'HOME' => node[:user][:home]
end

bash "fix npm files" do
  code <<-EOH
    chown -R #{node[:user][:name]} #{node[:user][:home]}/.npm
    chown -R #{node[:user][:name]} /usr/local/lib/node_modules
  EOH
end
