# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
# adds ">> /dev/null 2>&1" to all commands
every 1.minute do
    set :output, {:error => './log/robot-log/builder-error.log', :standard => './log/robot-log/builder.log'}
    rake "robots:builder"
end

every 30.minute do
    set :output, {:error => './log/robot-log/guard-error.log', :standard => './log/robot-log/guard.log'}
    rake "robots:guard"
end

every 1.minute do
    set :output, {:error => './log/robot-log/buyer-error.log', :standard => './log/robot-log/buyer.log'}
    rake "robots:buyer"
end

every 1.minute do
    set :output, {:error => './log/robot-log/changer-error.log', :standard => './log/robot-log/changer.log'}
    rake "robots:changer"
end

every 1.day, at: '0:00 am' do
    set :output, {:error => './log/robot-log/initialize-error.log', :standard => './log/robot-log/initialize.log'}
    puts "initialize db"
    rake "robots:initialize"
end