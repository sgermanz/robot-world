class Order < ApplicationRecord
    belongs_to :store_stock
    def self.getRandomOrder
        self.all.sample
    end
end
