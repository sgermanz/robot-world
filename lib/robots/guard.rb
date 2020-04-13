class Guard
    def onCarBuilt(car)
        defects = car.defects 
        if defects.length() == 0 
            puts "Car built successfully"
        else 
            puts "Car with defects"
            puts defects.to_json
        end
    end
    def moveToStore
        items = WarehouseStock.where(status: "new")
        items.each do |item|
            defects = item.car.defects.length()
            puts "defects"
            puts defects
            if defects == 0
                item.update(status: WarehouseStock.getMovedStatus)
                StoreStock.create(car_id: item.car_id, status: StoreStock.getNewStatus)
            end
        end
    end
end