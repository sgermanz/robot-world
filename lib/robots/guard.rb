class Guard
    def defects(car)
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
        return defects
    end
    def onCarBuilt(car)
        defects(car)
    end
    def moveToStore
        items = WarehouseStock.where(status: "new")
        items.each do |item|
            defects = self.defects(item.car).length()
            puts "defects"
            puts defects
            if defects == 0
                item.update(status: WarehouseStock.getMovedStatus)
                StoreStock.create(car_id: item.car_id, status: StoreStock.getNewStatus)
            end
        end
    end
end