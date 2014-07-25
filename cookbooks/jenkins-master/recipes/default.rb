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

cookbook_file "/home/sample-job.yaml" do
	source "sample-job.yaml"
end

build_jenkins_job 'sample-job' do
	job_config "/home/sample-job.yaml"
end