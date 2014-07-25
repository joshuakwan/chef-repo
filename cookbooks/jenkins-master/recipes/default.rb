#
# Cookbook Name:: jenkins-master
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "jenkins::master"

jenkins_plugin 'build-flow-plugin' do 
	notifies :restart, 'service[jenkins]', :immediately	
end

include_recipe "jenkins-job-builder"

default['jenkins-job-builder']['user'] = 'root'
default['jenkins-job-builder']['group'] = 'root'
default['jenkins-job-builder']['username'] = ''
default['jenkins-job-builder']['password'] = ''
default['jenkins-job-builder']['url'] = 'http://127.0.0.1:8080'