require './lib/robots/builder.rb'
namespace :robots do
  desc "Builder Robot"
  task builder: :environment do
    require "#{Rails.root}/lib/robots/builder"
    require "#{Rails.root}/lib/robots/guard"
    puts "I'm the robot builder"
    guard = Guard.new
    builder = Builder.new
    builder.setGuard (guard)
    builder.build
    puts "I built"
  end

end
