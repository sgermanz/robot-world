require './lib/robots/builder.rb'
namespace :robots do
  desc "Builder Robot"
  task builder: :environment do
    require "#{Rails.root}/lib/robots/builder"
    require "#{Rails.root}/lib/robots/guard"
    guard = Guard.new
    builder = Builder.new
    builder.setGuard (guard)

    builder.build
  end

end
