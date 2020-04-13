require 'rails_helper'
require "#{Rails.root}/lib/robots/builder"
require "#{Rails.root}/lib/robots/guard"
require "#{Rails.root}/lib/robots/buyer"

RSpec.describe Buyer, type: :model do
    it 'should buy some cars' do
        guard = Guard.new
        builder = Builder.new
        builder.setGuard (guard)
        builder.build
        
        guard = Guard.new
        guard.moveToStore

        buyer = Buyer.new
        buyer.buy

        sold_stock = StoreStock.where(status: StoreStock.getSoldStatus).count
        orders = Order.all.count

        expect(sold_stock > 0).to eq(true)
        expect(orders > 0).to eq(true)
    end
    it 'should change and order' do
        guard = Guard.new
        builder = Builder.new
        builder.setGuard (guard)
        builder.build
        
        guard = Guard.new
        guard.moveToStore

        buyer = Buyer.new
        buyer.buy
        buyer.change

        returned_stock = StoreStock.where(status: StoreStock.getReturnedStatus).count
        puts returned_stock
        changes = OrderChange.all.count
        orders = Order.where(changes_amount:1).count

        expect(returned_stock > 0).to eq(true)
        expect(orders > 0).to eq(true)
        expect(changes > 0).to eq(true)
    end
  end
  