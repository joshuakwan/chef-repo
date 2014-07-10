# roles/german-hosts.rb
name "german-hosts"
description "This Role contains hosts, which should print out their messages in German"
run_list "recipe[joshua_cookbook]"
default_attributes "joshua_cookbook" => { "message" => "Hallo Welt!" }