homebrew_package 'rbenv'
homebrew_package 'ruby-build'

rbenv_root = "#{node['user']['home']}/.rbenv"

# Can not install ruby by rbenv over "bundle exec chef-solo"
#   installing bundle gems: Permission denied @ rb_sysopen
# node['arcadia']['rbenv']['install_versions'].each do |version|
#   bash "Install ruby #{version}" do
#     code <<-EOH
#       rbenv init -
#       rbenv install #{version}
#     EOH
#     environment({ 'PATH' => "#{rbenv_root}/shims:#{rbenv_root}/bin:#{ENV['PATH']}" })
#     not_if { ::Dir.exist?("#{rbenv_root}/versions/#{version}") }
#   end
# end

# Gemfile for tools
template "#{node['arcadia']['project_path']}/Gemfile" do
  source 'developer-tools/Gemfile.erb'
  owner node['user']['name']
  group node['user']['group']
  mode 00644
end

puts "Executes commands to setup ruby: "
node['arcadia']['rbenv']['install_versions'].each do |version|
  puts "  rbenv install #{version}" unless ::Dir.exist?("#{rbenv_root}/versions/#{version}")
end
puts <<-EOH
  rbenv global #{node['arcadia']['rbenv']['default_version']}
  gem update --system
  gem i bundler
  pushd #{node['arcadia']['project_path']}; bundle install; popd;
EOH
