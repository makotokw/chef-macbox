# arcadia
default[:arcadia][:project_path] = "#{node[:user][:home]}/arcadia"

# php
default[:arcadia][:php][:package] = 'php55'
default[:arcadia][:php][:package_option] = '--with-homebrew-openssl --without-apache'
default[:arcadia][:php][:ext_packages] = %w{php55-memcache php55-mcrypt php55-xdebug phpunit}
default[:arcadia][:php][:conf_path] = '/usr/local/etc/php/5.5'
