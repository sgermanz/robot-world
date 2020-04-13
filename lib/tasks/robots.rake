logger = Logger.new("#{Rails.root}/log/robots.log")
namespace :robots do
  desc "Builder Robot"
  task builder: :environment do
    require "#{Rails.root}/lib/robots/builder"
    require "#{Rails.root}/lib/robots/guard"
    logger.info "BUILDER: init"
    guard = Guard.new
    builder = Builder.new
    builder.setGuard (guard)
    
    builder.build
  end

  desc "Guard Robot"
  task guard: :environment do
    require "#{Rails.root}/lib/robots/guard"
    logger.info "GUARD: init"

    guard = Guard.new
    guard.moveToStore
  end

  desc "Buyer Robot"
  task buyer: :environment do

    configuration = JSON.parse StoreConfiguration.all.first.configuration
    schedule = configuration["buyer_schedule"]
    if !schedule.nil? and Time.current.min%schedule==0
      logger.info "BUYER: init"
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
      logger.info "CHANGER: init"
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
    logger.info "RESET DB: init"

    system("rails db:drop")
    system("rails db:create")
    system("rails db:migrate")
    system("rails db:seed")
  end
  
  desc "Test"
  task test: :environment do
    logger.info "TEST: init"
    system("rails db:drop RAILS_ENV=test")
    system("rails db:create RAILS_ENV=test")
    system("rails db:migrate RAILS_ENV=test")
    system("rspec")
  end
end
