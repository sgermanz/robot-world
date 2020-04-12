class StoreStock < ApplicationRecord
    belongs_to :car
    def self.getNewStatus
        return "new"
    end
    def self.getSoldStatus
        return "sold"
    end
    def self.getReturnedStatus
        return "returned"
    end
end
