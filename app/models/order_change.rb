class OrderChange < ApplicationRecord
    belongs_to :order
    belongs_to :store_stock
end
