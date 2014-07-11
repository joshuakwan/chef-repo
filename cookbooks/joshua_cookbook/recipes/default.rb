#
# Cookbook Name:: joshua_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

message = node['joshua_cookbook']['message']
Chef::Log.info("** Saying what I was told to say: #{message}")

chef_gem 'ipaddress'
require 'ipaddress'
ip = node['ipaddress']
mask = IPAddress.netmask(ip)
Chef::Log.info("Netmask of #{ip}: #{mask}")

template '/tmp/message' do
  source 'message.erb'
  variables(
    hi: 'Hallo',
    world: 'Welt',
    from: node['fqdn']
  )
end

joshua_deploy_dirs do
  deploy_to "/srv"
end

search(:hooks, "*:*").each do |hook|
  http_request 'callback' do
    url hook['url']
  end
end

file "/etc/backup_config.json" do
  owner "root"
  group "root"
  mode 0644
  content data_bag_item('servers','backup')['host'].to_json
end