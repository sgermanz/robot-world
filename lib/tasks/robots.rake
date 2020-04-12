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

  desc "Guard Robot"
  task guard: :environment do
    require "#{Rails.root}/lib/robots/guard"

    guard = Guard.new
    guard.moveToStore
  end

  desc "Buyer Robot"
  task buyer: :environment do
    require "#{Rails.root}/lib/robots/buyer"

    buyer = Buyer.new
    buyer.buy
  end

  desc "Changer Robot"
  task changer: :environment do
    require "#{Rails.root}/lib/robots/buyer"

    buyer = Buyer.new
    buyer.change
  end

  desc "Initialize DB"
  task initialize: :environment do
    system("rails db:drop")
    system("rails db:create")
    system("rails db:migrate")
    system("rails db:seed")
  end
end
