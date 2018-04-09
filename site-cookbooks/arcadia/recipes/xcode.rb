homebrew_package 'remove xcproj' do
  package_name 'xcproj'
  action :remove
end
homebrew_package 're-install xcproj' do
  package_name 'xcproj'
  action :install
end
