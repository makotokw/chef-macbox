homebrew_package 'nodebrew'

execute 'nodebrew install-binary stable'
execute 'nodebrew use stable'
execute 'npm install -g gulp grunt-cli bower'
