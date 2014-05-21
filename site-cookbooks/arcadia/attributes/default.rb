default[:user] = `echo $SUDO_USER`.strip

# php
default[:php][:conf_path] = '/usr/local/etc/php/5.5'
