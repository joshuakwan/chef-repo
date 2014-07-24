# jenkins-server.rb
# Good, it works for installing a Jenkins master
name "jenkins-server"
description "Role for Jenkins Servers"
run_list "recipe[jenkins::master]"