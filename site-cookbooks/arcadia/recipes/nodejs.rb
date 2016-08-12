case node[:arcadia][:nodejs][:pacakge_manager]
when 'nvm'
  # https://github.com/hokaccha/nodebrew
  execute 'wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash'
  bash 'install node' do
    code <<-EOH
      export NVM_DIR="$HOME/.nvm"; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
      nvm install #{node[:arcadia][:nodejs][:version]}
    EOH
  end
  bash 'install npm package' do
    code <<-EOH
      export NVM_DIR="$HOME/.nvm"; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
      npm install -g #{node[:arcadia][:nodejs][:npm_packages].join(' ')}
    EOH
  end
when 'nodebrew'
  homebrew_package 'nodebrew'
  execute 'nodebrew setup'
  execute "nodebrew install-binary #{node[:arcadia][:nodejs][:version]}" do
    returns [0, 1]
  end
  execute "nodebrew use #{node[:arcadia][:nodejs][:version]}"
  execute "export PATH=$HOME/.nodebrew/current/bin:$PATH;npm install -g #{node[:arcadia][:nodejs][:npm_packages].join(' ')}"
end
