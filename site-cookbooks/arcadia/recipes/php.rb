template "#{node[:arcadia][:php][:conf_path]}/conf.d/arcadia.ini" do
  source 'php/conf.d/arcadia.ini.erb'
  owner node[:user][:name]
  group 'admin'
  mode 00644
end
