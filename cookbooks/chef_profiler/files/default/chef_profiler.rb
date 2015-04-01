# Chef (simple) Profiler for reporting cookbook execution times
#
# Author:: Joe Miller <https://github.com/joemiller>
# Copyright:: Copyright 2012 Joe Miller
# License:: MIT License
#


class Chef
  class Handler
    class Profiler < Chef::Handler
      VERSION = '0.0.2'

      def report
        cookbooks = Hash.new(0)
        recipes = Hash.new(0)
        resources = Hash.new(0)

        # collect all profiled timings and group by type
        all_resources.each do |r|
          cookbooks[r.cookbook_name] += r.elapsed_time
          recipes["#{r.cookbook_name}::#{r.recipe_name}"] += r.elapsed_time
          resources["#{r.resource_name}[#{r.name}]"] = r.elapsed_time
        end

        # puts each timing by group, sorting with highest elapsed time first
        puts "Elapsed_time  Cookbook"
        puts "------------  -------------"
        cookbooks.sort_by{ |k,v| -v }.each do |cookbook, run_time|
          puts "%12f  %s" % [run_time, cookbook]
        end
        puts ""

        puts "Elapsed_time  Recipe"
        puts "------------  -------------"
        recipes.sort_by{ |k,v| -v }.each do |recipe, run_time|
          puts "%12f  %s" % [run_time, recipe]
        end
        puts ""

        puts "Elapsed_time  Resource"
        puts "------------  -------------"
        resources.sort_by{ |k,v| -v }.each do |resource, run_time|
          puts "%12f  %s" % [run_time, resource]
        end
        puts ""
      end

    end
  end
end