class Order < ApplicationRecord
    belongs_to :store_stock
    has_many :order_changes
    def self.getRandomOrder
        self.all.sample
    end

    def get_last_change
        return self.order_changes.last
    end
    
    def has_changes?
        return self.changes.count > 0
    end
    
end
