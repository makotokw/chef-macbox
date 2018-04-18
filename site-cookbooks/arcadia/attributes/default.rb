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
default[:arcadia][:nodejs][:pacakge_manager] = 'n'
default[:arcadia][:nodejs][:version] = case node[:arcadia][:nodejs][:pacakge_manager]
when 'n'
  'stable'
when 'nvm'
  # node: this installs the latest version of node
  # 'node'
  'v5.12.0'
when 'nodebrew'
  '5.2.0'
end
default[:arcadia][:nodejs][:npm_packages] = %w{yarn bower grunt-cli gulp}

# php
default[:arcadia][:php5][:package] = 'php@5.6'
default[:arcadia][:php5][:package_option] = nil
default[:arcadia][:php5][:ext_packages] = %w{}
default[:arcadia][:php5][:conf_path] = '/usr/local/etc/php/5.6'

default[:arcadia][:php7][:package] = 'php'
default[:arcadia][:php7][:package_option] = nil
default[:arcadia][:php7][:ext_packages] = %w{}
default[:arcadia][:php7][:conf_path] = '/usr/local/etc/php/7.2'
