# arcadia
default[:arcadia][:project_path] = "#{node[:user][:home]}/arcadia"

# cask Applications
default[:arcadia][:cask_application] = []

# nodejs
default[:arcadia][:nodejs][:version] = '5.2.0'

# php
default[:arcadia][:php5][:package] = 'php55'
default[:arcadia][:php5][:package_option] = '--with-homebrew-openssl --without-apache'
default[:arcadia][:php5][:ext_packages] = %w{php55-memcache php55-mcrypt php55-xdebug phpunit}
default[:arcadia][:php5][:conf_path] = '/usr/local/etc/php/5.5'
