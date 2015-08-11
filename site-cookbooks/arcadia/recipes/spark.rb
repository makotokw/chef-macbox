homebrew_package 'apache-spark'

# scala 2.10.x
homebrew_tap 'homebrew/versions'
homebrew_package 'scala210'
execute 'brew link scala210 --force'

# sbt
homebrew_package 'sbt'
