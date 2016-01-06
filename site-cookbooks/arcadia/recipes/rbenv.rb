homebrew_package 'rbenv'
homebrew_package 'ruby-build'

rbenv_root = "#{node[:user][:home]}/.rbenv"

# Can not install ruby by rbenv over "bundle exec chef-solo"
#   installing bundle gems: Permission denied @ rb_sysopen
# node[:arcadia][:rbenv][:install_versions].each do |version|
#   bash "Install ruby #{version}" do
#     code <<-EOH
#       rbenv init -
#       rbenv install #{version}
#     EOH
#     environment({ 'PATH' => "#{rbenv_root}/shims:#{rbenv_root}/bin:#{ENV['PATH']}" })
#     not_if { ::Dir.exist?("#{rbenv_root}/versions/#{version}") }
#   end
# end

puts "Executes commands to install ruby: "
node[:arcadia][:rbenv][:install_versions].each do |version|
  puts "  rbenv install #{version}" unless ::Dir.exist?("#{rbenv_root}/versions/#{version}")
end
puts "rbenv global #{node[:arcadia][:rbenv][:default_version]}"
