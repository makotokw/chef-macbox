# arcadia
default[:arcadia][:project_path] = "#{node[:user][:home]}/arcadia"

# cask Applications
default[:arcadia][:cask_taps] = ['caskroom/versions', 'makotokw/cask']
default[:arcadia][:cask_applications_require_interactive] = []
default[:arcadia][:cask_applications] = []

# ruby
default[:arcadia][:rbenv][:install_versions] = ['2.3.3']
default[:arcadia][:rbenv][:default_version] = '2.3.3' # for macOS High Sierra

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
default[:arcadia][:php5][:package] = 'php56'
default[:arcadia][:php5][:package_option] = '--with-homebrew-openssl --without-apache'
default[:arcadia][:php5][:ext_packages] = %w{php56-memcache php56-mcrypt php56-xdebug}
default[:arcadia][:php5][:conf_path] = '/usr/local/etc/php/5.6'

default[:arcadia][:php7][:package] = 'php70'
default[:arcadia][:php7][:package_option] = '--with-homebrew-openssl --without-apache'
default[:arcadia][:php7][:ext_packages] = %w{php70-mcrypt php70-xdebug}
default[:arcadia][:php7][:conf_path] = '/usr/local/etc/php/7.0'
