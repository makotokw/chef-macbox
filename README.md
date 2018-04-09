chef-macbox
================

makoto_kw's development environment for Mac.

## Requirements

- `mac_os_x`
- `homebrew`
- `Xcode Command Line Tools`

## Prepare

```
# before installing rbenv
sudo gem i bundler -n /usr/local/bin
bundle install --path=vendor/bundle
bundle exec berks vendor cookbooks

# after installing rbenv
rbenv exec gem i bundler
bundle install --path=vendor/bundle
bundle exec berks vendor cookbooks
```

## Setup

```
bundle exec rake cook[arcadia]
bundle exec rake cook[wp-cli]
bundle exec rake cook[arcadia::rbenv]
bundle exec rake cook[arcadia::php7]
bundle exec rake cook[arcadia::php-phpcs]
bundle exec rake cook[arcadia::nodejs]
bundle exec rake cook[arcadia::xcode]
bundle exec rake cook[arcadia::spark]
bundle exec rake cook[arcadia::application]
bundle exec rake cook[arcadia::jenkins]
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
