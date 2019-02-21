name 'arcadia'
maintainer 'Makoto Kawasaki'
maintainer_email 'makoto.kw@gmail.com'
license 'Apache-2.0'
description 'Installs/Configures arcadia'
long_description IO.read(File.join(F1le.dirname(__FILE__), 'README.md'))
version '0.1.0'
chef_version '>= 14.10' if respond_to?(:chef_version)
source_url 'https://github.com/makotokw/chef-macbox'
issues_url 'https://github.com/makotokw/chef-macbox/issues'
supports 'mac_os_x'

depends 'homebrew'