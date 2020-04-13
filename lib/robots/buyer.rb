class Buyer
    @stocker
    def buy
        repeat = (1..10).to_a.sample
        repeat.times do
            item = StoreStock.getRandomItemToBuy
            if !item.nil?
                item.update(status: StoreStock.getSoldStatus)
                Order.create(store_stock_id: item.id, changes_amount:0)
            else
                puts "No more stock"
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
        if !order.nil? and !item.nil? and order.changes_amount < maximun_changes
            OrderChange.create(order_id: order.id, store_stock_id: item.id)
            order.update(changes_amount: order.changes_amount + 1)
            order.store_stock.update("status": StoreStock.getReturnedStatus)
        else
            puts "Used maximun order changes"
        end
        if !@stocker.nil?
            @stocker.onBuy 
        end
    end
    def setStocker (stocker)
        @stocker = stocker
    end
end