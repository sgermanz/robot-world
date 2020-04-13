class StoreStock < ApplicationRecord
    belongs_to :car
    has_many :orders
    def self.getNewStatus
        return "new"
    end
    def self.getSoldStatus
        return "sold"
    end
    def self.getReturnedStatus
        return "returned"
    end

    def self.getRandomItemToBuy
        self.where(status: getNewStatus).or(self.where(status: getReturnedStatus)).sample
    end

    def self.getStockByModel
        stock = Hash.new
        items = self.where(status: getNewStatus).or(self.where(status: getReturnedStatus))
        items.each do |item|
            model_id = item.car.car_model.id 
            if stock[model_id].nil?
                stock[model_id] = 1
            else
                stock[model_id] = stock[model_id] + 1 
            end
        end
        return stock
    end
end
