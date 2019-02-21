case node['arcadia']['nodejs']['pacakge_manager']
when 'n'
  homebrew_package 'node'
  bash 'install node by n' do
    code <<-EOH
      npm cache clean -f
      npm install -g n
      sudo n #{node['arcadia']['nodejs']['version']}
      npm install -g #{node['arcadia']['nodejs']['npm_packages'].join(' ')}
    EOH
  end
when 'nvm'
  # https://github.com/hokaccha/nodebrew
  execute 'wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.4/install.sh | bash' do
    not_if 'which nvm'
  end
  bash 'install node' do
    code <<-EOH
      export NVM_DIR="$HOME/.nvm"; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
      nvm install #{node['arcadia']['nodejs']['version']}
      nvm alias default #{node['arcadia']['nodejs']['version']}
    EOH
  end
  bash 'install npm package into nvm' do
    code <<-EOH
      export NVM_DIR="$HOME/.nvm"; [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
      nvm use #{node['arcadia']['nodejs']['version']}
      npm install -g #{node['arcadia']['nodejs']['npm_packages'].join(' ')}
    EOH
  end
when 'nodebrew'
  homebrew_package 'nodebrew'
  execute 'nodebrew setup'
  execute "nodebrew install-binary #{node['arcadia']['nodejs']['version']}" do
    returns [0, 1]
  end
  execute "nodebrew use #{node['arcadia']['nodejs']['version']}"
  bash 'install npm package into nodebrew' do
    code <<-EOH
      export PATH=$HOME/.nodebrew/current/bin:$PATH
      npm install -g #{node['arcadia']['nodejs']['npm_packages'].join(' ')}
    EOH
  end
end
