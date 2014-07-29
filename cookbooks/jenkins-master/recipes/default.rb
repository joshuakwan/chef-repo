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

jenkins_password_credentials 'root' do
  description 'Nimbus Default'
  password    'passw0rd'
end

jenkins_ssh_slave 'chef-managed-slave' do
  description 'This slave is managed by Chef'
  remote_fs   '/share/executor'
  labels      ['executor', 'nimbus', 'chef']
  host        '9.114.194.75'
  user        'jenkins'
  credentials 'root'
end

include_recipe "jenkins-job-builder"

cookbook_file "/usr/local/share/sample-jobs.yaml" do
	source "sample-jobs.yaml"
end

cookbook_file "/usr/local/share/job-deploy.yaml" do
	source "job-deploy.yaml"
end

build_jenkins_job 'job-deploy' do
	job_config "/usr/local/share/job-deploy.yaml"
end