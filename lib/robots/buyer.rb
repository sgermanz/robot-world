class Buyer
    def buy
        repeat = (1..10).to_a.sample
        repeat.times do
            item = StoreStock.getRandomItem
            if !item.nil?
                item.update(status: StoreStock.getSoldStatus)
                Order.create(store_stock_id: item.id, changes_amount:0)
            else
                puts "No more stock"
            end
        end
    end
end