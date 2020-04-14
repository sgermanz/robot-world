class Builder
    @guard
    def logger
        @@logger ||= Logger.new("#{Rails.root}/log/robots.log")
    end
    def build
        10.times do
            car = Car.createRandomCar
            WarehouseStock.create(car_id: car.id, status: WarehouseStock.getNewStatus)
            logger.info "BUILDER: car buildt " + car.car_model.name + " " + car.id.to_s
            if !@guard.nil?
                @guard.onCarBuilt(car) 
            end
        end
    end
    def setGuard (aGuard)
        @guard = aGuard
    end
end