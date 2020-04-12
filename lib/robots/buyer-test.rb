require "#{Rails.root}/lib/robots/builder"
require "#{Rails.root}/lib/robots/guard"
require "#{Rails.root}/lib/robots/buyer"

buyer = Buyer.new
buyer.buy
