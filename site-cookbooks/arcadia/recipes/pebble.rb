directory "#{node[:user][:home]}/pebble-dev" do
  owner node[:user][:name]
  group node[:user][:group]
  mode 00755
  action :create
end

file "#{node[:user][:home]}/pebble-dev/NO_TRACKING" do
  owner node[:user][:name]
  group node[:user][:group]
  mode 00644
  action :touch
end
