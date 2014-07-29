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

directory "/usr/local/share/jenkins_jobs/" do
  owner "root"
  group "root"
  mode 0755
  action :create
end

cookbook_file "/usr/local/share/jenkins_jobs/sample-jobs.yaml" do
	source "sample-jobs.yaml"
end

build_jenkins_job do
	job_config "/usr/local/share/jenkins_jobs/"
end