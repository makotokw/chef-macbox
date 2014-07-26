current_dir = File.expand_path(File.dirname(__FILE__))

file_cache_path  "#{current_dir}/.chef/cache"
file_backup_path "#{current_dir}/.chef/backup"
cache_options( :path => "#{current_dir}/.chef/checksums", :skip_expires => true )

cookbook_path    ["#{current_dir}/cookbooks", "#{current_dir}/site-cookbooks"]
node_path        "#{current_dir}/nodes"
role_path        "#{current_dir}/roles"
environment_path "#{current_dir}/environments"
data_bag_path    "#{current_dir}/data_bags"
#encrypted_data_bag_secret "#{current_dir}/data_bag_key"

verify_api_cert true
