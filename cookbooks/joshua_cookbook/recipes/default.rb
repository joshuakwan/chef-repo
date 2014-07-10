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

template '/tmp/message' do
  source 'message.erb'
  variables(
    hi: 'Hallo',
    world: 'Welt',
    from: node['fqdn']
  )
end