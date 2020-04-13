class Stocker
    def logger
        @@logger ||= Logger.new("#{Rails.root}/log/robots.log")
    end
    def onBuy
        validate
    end
    private
    def validate
        carModels = CarModel.all
        configuration = JSON.parse StoreConfiguration.all.first.configuration
        min_stocks = configuration["min_stock"]
        modelStocks = StoreStock.getStockByModel
        carModels.each do |carModel|
            model_id = carModel.id.to_s
            min_stock = min_stocks[model_id]
            current_stock = modelStocks[carModel.id]
            if  current_stock < min_stock
                logger.info "STOCKER: model to stock " + carModel.name
                to_stock = min_stock - current_stock
                stock(model_id, to_stock)
            end
        end
    end
    def stock(model_id, to_stock)
        items = WarehouseStock.where(status: WarehouseStock.getNewStatus).where(car_id: Car.select("id").where(car_model_id: model_id))
        count = 0
        items.each do |item|
            break if count == to_stock
            if item.car.defects.length() == 0
                item.update(status: WarehouseStock.getMovedStatus)
                StoreStock.create(car_id: item.car_id, status: StoreStock.getNewStatus)
                count = count + 1
            end
        end
    end
end