require "#{Rails.root}/lib/robots/slack-service"

class Report
    def self.dailyReport
        cars_sold = Hash.new
        CarModel.all.each do |model|
            cars_sold[model.name] = 0
        end
        
        total_revenue = 0
        sales_amount = 0
        orders = Order.all
        orders.each do |order|
            if order.has_changes?
                change = order.get_last_change
                car = change.store_stock.car
            else
                car = order.store_stock.car
            end
            sales_amount = sales_amount + 1
            total_revenue = total_revenue + car.revenue
            
            cars_sold[car.car_model.name] = cars_sold[car.car_model.name] + 1 
        end
        
        message = "Daily revenue: " + total_revenue.round(2).to_s + "\n"
        message = message + "Average order value " + (total_revenue/sales_amount).round(2).to_s + "\n"
        message = message + "Cars Sold: " + "\n"
        cars_sold.each do |key, value|
            message = message +  "Model: " + key + " " + "amount: " + value.to_s + "\n"
        end 
        
        SlackService.sendMessage(message)
    end
end
