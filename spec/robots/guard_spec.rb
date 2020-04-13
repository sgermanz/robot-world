require 'rails_helper'

RSpec.describe Guard, type: :model do
    it 'should move 10 cars to store' do
        require "#{Rails.root}/lib/robots/builder"
        require "#{Rails.root}/lib/robots/guard"
        
        guard = Guard.new
        builder = Builder.new
        builder.setGuard (guard)
        builder.build
        
        guard = Guard.new
        guard.moveToStore

        amount_in_store = StoreStock.all.count

        expect(amount_in_store).to eq(10)
    end
  end
  