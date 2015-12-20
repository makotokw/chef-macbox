homebrew_package 'nodebrew'

execute 'nodebrew setup'
execute "nodebrew install-binary #{node[:arcadia][:nodejs][:version]}" do
  returns [0, 1]
end
execute "nodebrew use #{node[:arcadia][:nodejs][:version]}"
execute 'export PATH=$HOME/.nodebrew/current/bin:$PATH;npm install -g yo bower grunt-cli gulp'
