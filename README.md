chef-macbox
================

makoto_kw's development environment for Mac.

## Prepare chef-solo

Install chef-solo to system's ruby instead of ``knife solo prepare``.

```
rbenv local system
sudo gem i knife-solo berkshelf
```
## Execute chef-solo

```
knife solo cook localhost -o "arcadia"
```
