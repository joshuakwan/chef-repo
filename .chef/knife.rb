# See http://docs.opscode.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "joshuakwan"
client_key               "#{current_dir}/joshuakwan.pem"
validation_client_name   "joshuag-validator"
validation_key           "#{current_dir}/joshuag-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/joshuag"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
cookbook_copyright "joshua g"
cookbook_license "apachev2"
cookbook_email "garfilone@gmail.com"
