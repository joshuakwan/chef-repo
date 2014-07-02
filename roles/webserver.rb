name "webserver"
description "Web Servers"
run_list "recipe[my-company]","recipe[apache]"
default_attributes({
  "company" => "IBM"
})