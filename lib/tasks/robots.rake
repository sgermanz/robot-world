namespace :robots do
  desc "Builder Robot"
  task builder: :environment do
    require "#{Rails.root}/lib/robots/builder"
    require "#{Rails.root}/lib/robots/guard"
    puts "Builder Robot " + Time.current.to_s
    guard = Guard.new
    builder = Builder.new
    builder.setGuard (guard)
    
    builder.build
  end

  desc "Guard Robot"
  task guard: :environment do
    require "#{Rails.root}/lib/robots/guard"
    puts "Guard Robot " + Time.current.to_s

    guard = Guard.new
    guard.moveToStore
  end

  desc "Buyer Robot"
  task buyer: :environment do

    configuration = JSON.parse StoreConfiguration.all.first.configuration
    schedule = configuration["buyer_schedule"]
    if !schedule.nil? and Time.current.min%schedule==0
      puts "Buyer Robot " + Time.current.to_s
      require "#{Rails.root}/lib/robots/buyer"
      require "#{Rails.root}/lib/robots/stocker"

      buyer = Buyer.new
      stocker = Stocker.new
      buyer.setStocker(stocker)
      buyer.buy
    end
  end

  desc "Changer Robot"
  task changer: :environment do
    configuration = JSON.parse StoreConfiguration.all.first.configuration
    schedule = configuration["buyer_schedule"]
    if !schedule.nil? and Time.current.min%schedule==0
      puts "Changer Robot " + Time.current.to_s
      require "#{Rails.root}/lib/robots/stocker"
      require "#{Rails.root}/lib/robots/buyer"

      buyer = Buyer.new
      stocker = Stocker.new
      buyer.setStocker(stocker)
      buyer.change
    end
  end
  desc "Initialize DB"
  task initialize: :environment do
    puts "Initialize DB " + Time.current.to_s

    system("rails db:drop")
    system("rails db:create")
    system("rails db:migrate")
    system("rails db:seed")
  end
  desc "Test"
  task test: :environment do
    puts "Tests " + Time.current.to_s
    system("pwd")
    system("rails db:drop RAILS_ENV=test")
    system("rails db:create RAILS_ENV=test")
    system("rails db:migrate RAILS_ENV=test")
    system("rails db:seed RAILS_ENV=test")
    system("rspec")
  end
end
