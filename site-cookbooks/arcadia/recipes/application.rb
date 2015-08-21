# Applications by cask
node[:arcadia][:cask_applications].each do |application|
  puts application
  homebrew_cask application
end
