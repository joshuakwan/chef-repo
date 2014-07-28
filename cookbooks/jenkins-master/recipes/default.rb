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

jenkins_plugin 'buildgraph-view' do
	notifies :restart, 'service[jenkins]', :immediately
end

jenkins_ssh_slave 'sample-executor' do
	description 'Sample executor created by Chef'
	remote_fs '/usr/local/jenkins'
	host '192.168.1.2'
end

include_recipe "jenkins-job-builder"

cookbook_file "/usr/local/share/sample-jobs.yaml" do
	source "sample-jobs.yaml"
end

build_jenkins_job 'sample-job' do
	job_config "/usr/local/share/sample-job.yaml"
end