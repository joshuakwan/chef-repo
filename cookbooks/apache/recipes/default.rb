#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# chef-repo\cookbooks\apache\recipes\default.rb

# install apache
package node["package_name"] do
  action :install
end

# start the apache service
# make sure the service starts on reboot
service node["service_name"] do
  action [:enable, :start]
end

# write out home page
template "#{node["document_root"]}/index.html" do
  source "index.html.erb"
  mode "0644"
end