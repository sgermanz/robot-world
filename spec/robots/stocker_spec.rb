require 'rails_helper'
require "#{Rails.root}/lib/robots/builder"
require "#{Rails.root}/lib/robots/guard"
require "#{Rails.root}/lib/robots/stocker"

RSpec.describe Stocker, type: :model do
    it 'should not stock new cars' do

        # build 10 cars 
        builder = Builder.new
        builder.build
        # set same model to all cars
        Car.update_all(car_model_id: 1) 
        # set minimum stock 
        store_configuration = StoreConfiguration.all.first
        configuration = JSON.parse store_configuration.configuration
        configuration["min_stock"][1] = 5
        store_configuration.configuration = configuration.to_json
        store_configuration.save
        # move cars to store
        guard = Guard.new
        guard.moveToStore
        # build more cars
        builder.build
        Car.update_all(car_model_id: 1) 
        # validate stock
        stocker = Stocker.new
        stock_before_validation = StoreStock.all.count
        stocker.send(:validate)
        stock_after_validation = StoreStock.all.count

        cars = Car.all
        successful_cars = 0
        expect(stock_before_validation).to eq(stock_after_validation)
    end
    it 'should stock new cars' do

        # build 10 cars 
        builder = Builder.new
        builder.build
        # set same model to all cars
        Car.update_all(car_model_id: 1) 
        # set minimum stock 
        store_configuration = StoreConfiguration.all.first
        configuration = JSON.parse store_configuration.configuration
        configuration["min_stock"][1] = 15
        store_configuration.configuration = configuration.to_json
        store_configuration.save
        # move cars to store
        guard = Guard.new
        guard.moveToStore
        # build more cars
        builder.build
        Car.update_all(car_model_id: 1) 
        # validate stock
        stocker = Stocker.new
        stock_before_validation = StoreStock.all.count
        stocker.send(:validate)
        stock_after_validation = StoreStock.all.count

        expect(stock_before_validation < stock_after_validation).to eq(true)
    end
  end
  