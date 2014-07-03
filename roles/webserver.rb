name "webserver"
description "Web Servers"
run_list "recipe[my-company]","recipe[apache]","recipe[chef-client::cron]"
default_attributes({
  "company" => "IBM"
})