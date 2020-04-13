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
        models = CarModel.all
        models.each do |model|
            stock[model.id] = 0
        end
        items = self.where(status: getNewStatus).or(self.where(status: getReturnedStatus))
        items.each do |item|
            model_id = item.car.car_model.id 
            stock[model_id] = stock[model_id] + 1 
        end
        return stock
    end
end
