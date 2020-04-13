require 'rails_helper'

RSpec.describe Computer, type: :model do
    it 'should build 10 cars' do
        require "#{Rails.root}/lib/robots/builder"
        require "#{Rails.root}/lib/robots/guard"
        
        guard = Guard.new
        builder = Builder.new
        builder.setGuard (guard)
        builder.build
        
        amount = Car.all.count
        amount_in_warehouse = WarehouseStock.all.count


        expect(amount).to eq(10)
        expect(amount_in_warehouse).to eq(10)
    end
  end
  