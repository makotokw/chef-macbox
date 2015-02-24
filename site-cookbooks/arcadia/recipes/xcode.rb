plugin_path = "#{node[:arcadia][:project_path]}/contrib/XcodePlugins"

directory plugin_path do
  owner node[:user][:name]
  group node[:user][:group]
  mode 00755
  action :create
end

# BBUncrustifyPlugin-Xcode
git "#{plugin_path}/BBUncrustifyPlugin-Xcode" do
  repository 'https://github.com/benoitsan/BBUncrustifyPlugin-Xcode.git'
  user node[:user][:name]
  group node[:user][:group]
  action :sync
end

# Dash-Plugin-for-Xcode
git "#{plugin_path}/Dash-Plugin-for-Xcode" do
  repository 'https://github.com/omz/Dash-Plugin-for-Xcode.git'
  user node[:user][:name]
  group node[:user][:group]
  action :sync
end

# build by xcodebuild = install plugin
%w{BBUncrustifyPlugin-Xcode Dash-Plugin-for-Xcode}.each do |plugin|
  execute 'xcodebuild' do
    cwd "#{plugin_path}/#{plugin}"
  end
end
