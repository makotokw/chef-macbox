homebrew_package 'jenkins'

template "#{node['user']['home']}/Library/LaunchAgents/homebrew.mxcl.jenkins.plist" do
  source 'jenkins/homebrew.mxcl.jenkins.plist.erb'
  owner node['user']['name']
  group 'admin'
  mode 00644
  notifies :run, 'bash[load_jenkins]'
end

bash "load_jenkins" do
  cwd node['user']['home']
  user node['user']['name']
  code <<-EOH
    launchctl load #{node['user']['home']}/Library/LaunchAgents/homebrew.mxcl.jenkins.plist
    sleep 5s
    launchctl stop homebrew.mxcl.jenkins
    sleep 5s
    launchctl start homebrew.mxcl.jenkins
  EOH
  environment 'HOME' => node['user']['home']
  action :nothing
end
