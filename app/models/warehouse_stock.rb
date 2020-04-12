class WarehouseStock < ApplicationRecord
    belongs_to :car
    def self.getNewStatus
        return "new"
    end
    def self.getMovedStatus
        return "moved"
    end
end
