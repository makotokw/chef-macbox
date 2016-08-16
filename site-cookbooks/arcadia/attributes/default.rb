# arcadia
default[:arcadia][:project_path] = "#{node[:user][:home]}/arcadia"

# cask Applications
default[:arcadia][:cask_taps] = ['caskroom/versions', 'makotokw/cask']
default[:arcadia][:cask_applications_require_interactive] = []
default[:arcadia][:cask_applications] = []

# ruby
default[:arcadia][:rbenv][:install_versions] = ['1.9.3-p551', '2.0.0-p648', '2.2.4']
default[:arcadia][:rbenv][:default_version] = '2.0.0-p648'

# nodejs
default[:arcadia][:nodejs][:pacakge_manager] = 'nvm'
default[:arcadia][:nodejs][:version] = case node[:arcadia][:nodejs][:pacakge_manager]
when 'nvm'
  # node: this installs the latest version of node
  # 'node'
  'v5.12.0'
when 'nodebrew'
  '5.2.0'
end
default[:arcadia][:nodejs][:npm_packages] = %w{yo bower grunt-cli gulp}

# php
default[:arcadia][:php5][:package] = 'php55'
default[:arcadia][:php5][:package_option] = '--with-homebrew-openssl --without-apache'
default[:arcadia][:php5][:ext_packages] = %w{php55-memcache php55-mcrypt php55-xdebug}
default[:arcadia][:php5][:conf_path] = '/usr/local/etc/php/5.5'
