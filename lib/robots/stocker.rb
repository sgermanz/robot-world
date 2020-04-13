class Stocker
    def onBuy
        validate
    end
    private
    def validate
        carModels = CarModel.all
        configuration = JSON.parse StoreConfiguration.all.first.configuration
        min_stocks = configuration[:min_stock]
        modelStocks = StoreStock.getStockByModel

        carModels.each do |carModel|
            model_id = carModel.id 
            minStock = min_stocks[model_id]
            current_stock = modelStocks[model_id]
            if  current_stock < min_stock
                to_stock = min_stock - current_stock
                stock(model_id, to_stock)
            end
    end
    def stock(model_id, to_stock)
        items = StoreStock.where(StoreStock.getNewStatus).or(StoreStock.where(StoreStock.getReturnedStatus)).where(car_id: Car.select("id").where(car_model_id: model_id)).take(to_stock)
        items.each do |item|
            item.update(status: WarehouseStock.getMovedStatus)
            StoreStock.create(car_id: item.car_id, status: StoreStock.getNewStatus)
        end
    end
end