task :default => [:foodcritic]
task :foodcritic do
  sh 'foodcritic -t ~FC001 site-cookbooks'
end

task :cook, [:recipe] do |t, args|
  args.with_defaults(recipe: 'arcadia')
  sh "chef-solo -c solo.rb -j nodes/localhost.json -o #{args[:recipe]}"
end
