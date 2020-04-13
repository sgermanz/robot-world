class Guard
    def logger
        @@logger ||= Logger.new("#{Rails.root}/log/robots.log")
    end
    def onCarBuilt(car)
        defects = car.defects 
        if defects.length() == 0 
            logger.info "GUARD: Car buildt succesfully" + " " + car.car_model.name + " " + car.id.to_s
        else 
            logger.info "GUARD: Car with defects" + " " + car.car_model.name + " " + car.id.to_s
        end
    end
    def moveToStore
        items = WarehouseStock.where(status: "new")
        items.each do |item|
            defects = item.car.defects.length()
            if defects == 0
                logger.info "GUARD: move to store " + item.car.car_model.name + " " + item.car.id.to_s
                item.update(status: WarehouseStock.getMovedStatus)
                StoreStock.create(car_id: item.car_id, status: StoreStock.getNewStatus)
            end
        end
    end
end