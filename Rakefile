require "./app"
require "sinatra/activerecord/rake"

#
begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:spec)
  rescue LoadError
    puts "Please 'bundle', first."
end
#
task default: [Rake::Task["db:test:prepare"], :spec]
