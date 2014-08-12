#
# Cookbook Name:: my-company
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
cookbook_file "/usr/local/share/build_artifact.txt" do
    source "build_artifact.txt"
end