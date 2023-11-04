class OrderDetail < ApplicationRecord
belongs_to :item
belongs_to :order
def add_tax_price
  (item.price * 1.10).round
end
def subtotal
  (item.price * 1.10).round * (quantity)
end
ActiveRecord::Import::OnDuplicateKeyUpdateSupport
end