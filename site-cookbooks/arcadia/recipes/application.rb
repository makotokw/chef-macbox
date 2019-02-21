# Applications by cask
node['arcadia']['cask_taps'].each do |tap|
  homebrew_tap tap
end

node['arcadia']['cask_applications'].each do |application|
  homebrew_cask application
end

node['arcadia']['cask_applications_require_interactive'].each do |application|
  Chef::Log.warn "Require interactive install: brew cask install #{application}"
end
