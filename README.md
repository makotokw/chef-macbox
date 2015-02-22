chef-macbox
================

makoto_kw's development environment for Mac.

## Requirements

- `mac_os_x`
- `homebrew`
- `Xcode Command Line Tools`

## Prepare

```
sudo gem install bundler
bundle install --path=vendor/bundle
bundle exec berks vendor cookbooks
```

## Setup

```
bundle exec rake cook[arcadia]
bundle exec rake cook[wp-cli]
bundle exec rake cook[pebble-dev]
bundle exec rake cook[arcadia::php]
```

## Development

add cookbook

```
bundle exec knife cookbook create sample_book -C "Makoto Kawasaki" -I apachev2 -m "makoto.kw@gmail.com" -r md -o site-cookbooks
```

lint cookbook

```
bundle exec rake foodcritic
```

### node.attribute

|key|example value|
|:--|:--|
|node[:os]|darwin|
|node[:os_version]|13.3.0|
|node[:platform_family]|mac_os_x|
|node[:platform]|mac_os_x|
|node[:platform_version]|10.9.4|
