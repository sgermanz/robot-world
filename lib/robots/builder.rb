class Builder
    @guard
    def build
        car = Car.createRandomCar
        WarehouseStock.create(car_id: car.id, status: WarehouseStock.getNewStatus)
        puts car.car_model.name
        puts car.year
        if !@guard.nil?
            @guard.onCarBuilt(car) 
        end
    end
    def setGuard (aGuard)
        @guard = aGuard
    end
end