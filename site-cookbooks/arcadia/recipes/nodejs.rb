homebrew_package 'nodebrew'

execute 'nodebrew setup'
execute 'nodebrew install-binary stable' do
  returns [0, 1]
end
execute 'nodebrew use stable'
execute 'export PATH=$HOME/.nodebrew/current/bin:$PATH;npm install -g gulp grunt-cli bower'
