# Symfony
bash "install symfony" do
  cwd node[:user][:home]
  user node[:user][:name]
  group node[:user][:group]
  code <<-EOH
    curl -LsS http://symfony.com/installer > symfony.phar
    sudo mv symfony.phar /usr/local/bin/symfony
    chmod a+x /usr/local/bin/symfony
  EOH
  environment 'HOME' => node[:user][:home]
end
