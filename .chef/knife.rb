current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "tm8311"
client_key               "#{current_dir}/tm8311.pem"
validation_client_name   "tm8311-validator"
validation_key           "#{current_dir}/tm8311-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/tm8311"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
