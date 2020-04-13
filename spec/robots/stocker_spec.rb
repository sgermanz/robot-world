require 'rails_helper'
require "#{Rails.root}/lib/robots/builder"
require "#{Rails.root}/lib/robots/guard"
require "#{Rails.root}/lib/robots/stocker"

RSpec.describe Computer, type: :model do
    it 'should not stock new cars' do

        # crear 10 autos 
        builder = Builder.new
        builder.build
        # setearles a todos el mismo modelo
        Car.update_all(car_model_id: 1) 
        # updatear stock configuration para que en ese modelo sean 5
        store_configuration = StoreConfiguration.all.first
        configuration = JSON.parse store_configuration.configuration
        configuration["min_stock"][1] = 5
        store_configuration.configuration = configuration.to_json
        store_configuration.save
        # correr move
        guard = Guard.new
        guard.moveToStore
        builder.build
        Car.update_all(car_model_id: 1) 
        # correr validate 
        stocker = Stocker.new
        stocker.send(:validate)
        # el stock debe seguir siendo 10
        amount_in_store = StoreStock.all.count
        expect(amount_in_store).to eq(10)
    end
  end
  