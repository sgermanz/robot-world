class CarModel < ApplicationRecord
    has_many :cars
    def self.getRandomCarModel
        return CarModel.all.sample
    end
end
