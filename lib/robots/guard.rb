class Guard
    def check(car)
        success = true
        defects = []
        status = JSON.parse car.computer.status
        status.each do |key, value|
            if !value
                defects.push(key)
                success = false
            end
        end
        if success 
            puts "Car built successfully"
        else 
            puts "Car with defects"
            puts defects.to_json
        end
        
    end
    def onCarBuilt(car)
        check(car)
    end
    def moveToStore
        items = WarehouseStock.where(status: "new")
        items.each do |item|
            item.update(status: WarehouseStock.getMovedStatus)
            StoreStock.create(car_id: item.car_id, status: StoreStock.getNewStatus)
        end
    end
end