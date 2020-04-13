require 'rails_helper'
require "#{Rails.root}/lib/robots/builder"
require "#{Rails.root}/lib/robots/guard"

RSpec.describe Guard, type: :model do
    it 'should move 10 cars to store' do
        
        guard = Guard.new
        builder = Builder.new
        builder.setGuard (guard)
        builder.build
        
        guard = Guard.new
        guard.moveToStore


        cars = Car.all
        successful_cars = 0
        cars.each do |car|
            if car.defects.length == 0
                successful_cars = successful_cars + 1
            end
        end
        amount_in_store = StoreStock.all.count

        expect(amount_in_store).to eq(successful_cars)
    end
  end
  