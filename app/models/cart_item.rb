class CartItem < ApplicationRecord
belongs_to :item
def add_tax_price
  (item.price * 1.10).round
end
def subtotal
  (item.price * 1.10).round * (amount)
end

end
