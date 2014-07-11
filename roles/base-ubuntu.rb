# roles/base-ubuntu.rb
name "base-ubuntu"
description "Base role for Ubuntu servers"
run_list "recipe[chef-client::config]","recipe[ohai]","recipe[apt]"