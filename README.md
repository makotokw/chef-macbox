chef-macbox
================

makoto_kw's development environment for macOS.

## Requirements

- macOS
- homebrew
- [ChefDK](https://downloads.chef.io/chefdk/) 3+

## Setup

```
berks vendor cookbooks
```

```
chef-solo -c solo.rb -j nodes/localhost.json -o arcadia
chef-solo -c solo.rb -j nodes/localhost.json -o wp-cli
chef-solo -c solo.rb -j nodes/localhost.json -o arcadia::rbenv
chef-solo -c solo.rb -j nodes/localhost.json -o arcadia::php7
chef-solo -c solo.rb -j nodes/localhost.json -o arcadia::php-phpcs
chef-solo -c solo.rb -j nodes/localhost.json -o arcadia::nodejs
chef-solo -c solo.rb -j nodes/localhost.json -o arcadia::xcode
chef-solo -c solo.rb -j nodes/localhost.json -o arcadia::application
chef-solo -c solo.rb -j nodes/localhost.json -o arcadia::jenkins
```

## Development

### update vendor cookbooks

```
berks update
berks vendor cookbooks
```

### add cookbook

```
knife cookbook create sample_book -C "Makoto Kawasaki" -I apachev2 -m "makoto.kw@gmail.com" -r md -o site-cookbooks
```

### checkstyle cookbook

```
foodcritic -t ~supermarket -t ~license site-cookbooks
```

### macOS node.attribute

``chef-solo -c solo.rb -j nodes/localhost.json -o arcadia::nodeinfo``

|key|example value|
|:---|:---|
|node[:os]|darwin|
|node[:os_version]|18.2.0|
|node[:platform_family]|mac_os_x|
|node[:platform]|mac_os_x|
|node[:platform_version]|10.14.3|
