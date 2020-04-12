class Buyer
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
    end
    def change
        order = Order.getRandomOrder
        if order.changes_amount < 2
            OrderChange.create(order_id: order.id)
            order.update(changes_amount: order.changes_amount + 1)
            order.store_stock.update("status": StoreStock.getReturnedStatus)
        else
                puts "Used maximun order changes"
        end
    end
end