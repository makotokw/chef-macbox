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
