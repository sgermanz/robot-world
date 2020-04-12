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

    def self.getRandomItem
        self.where(status: getNewStatus).or(self.where(status: getReturnedStatus)).sample
    end
end
