#
# Cookbook Name:: chef_profiler
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "chef_handler"

cookbook_file "#{node["chef_handler"]["handler_path"]}/chef_profiler.rb" do
  source "chef_profiler.rb"
  owner "root"
  group "root"
  mode 00755
  action :create
end

chef_handler "Chef::Handler::Profiler" do
  source "#{node["chef_handler"]["handler_path"]}/chef_profiler.rb"
  supports :report => true
  action :enable
end