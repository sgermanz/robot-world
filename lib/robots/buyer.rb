class Buyer
    def logger
        @@logger ||= Logger.new("#{Rails.root}/log/robots.log")
    end
    @stocker
    def buy
        repeat = (1..10).to_a.sample
        repeat.times do
            item = StoreStock.getRandomItemToBuy
            if !item.nil?
                logger.info "BUYER: car sold " + item.car.car_model.name + " " + item.car.id.to_s
                item.update(status: StoreStock.getSoldStatus)
                Order.create(store_stock_id: item.id, changes_amount:0)
            else
                logger.info "BUYER: no more stock"
            end
        end
        if !@stocker.nil?
            @stocker.onBuy
        end
    end
    def change
        order = Order.getRandomOrder
        item = StoreStock.getRandomItemToBuy
        configuration = JSON.parse StoreConfiguration.all.first.configuration
        maximun_changes = configuration["maximun_changes"]
        if !order.nil? and !item.nil? 
            if order.changes_amount < maximun_changes
                logger.info "CHANGER: car returned " + order.store_stock.car.car_model.name + " " + order.store_stock.car.id.to_s
                logger.info "CHANGER: car ordered " + item.car.car_model.name + " " + item.car.id.to_s
                OrderChange.create(order_id: order.id, store_stock_id: item.id)
                order.update(changes_amount: order.changes_amount + 1)
                order.store_stock.update("status": StoreStock.getReturnedStatus)
            else
                logger.info "CHANGER: Used maximun order changes"
            end
        else
            logger.info "CHANGER: No more stock"
        end
        if !@stocker.nil?
            @stocker.onBuy 
        end
    end
    def setStocker (stocker)
        @stocker = stocker
    end
end