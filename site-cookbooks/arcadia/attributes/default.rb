# arcadia
default[:arcadia][:project_path] = "#{node[:user][:home]}/arcadia"

# cask Applications
default[:arcadia][:cask_applications_require_interactive] = []
default[:arcadia][:cask_application] = []

# ruby
default[:arcadia][:rbenv][:install_versions] = ['1.9.3-p551', '2.0.0-p648', '2.2.4']
default[:arcadia][:rbenv][:default_version] = '2.0.0-p648'

# nodejs
default[:arcadia][:nodejs][:version] = '5.2.0'

# php
default[:arcadia][:php5][:package] = 'php55'
default[:arcadia][:php5][:package_option] = '--with-homebrew-openssl --without-apache'
default[:arcadia][:php5][:ext_packages] = %w{php55-memcache php55-mcrypt php55-xdebug phpunit}
default[:arcadia][:php5][:conf_path] = '/usr/local/etc/php/5.5'
