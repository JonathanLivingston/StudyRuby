class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :product, :quantity, :price
  belongs_to :product
  belongs_to :cart
  
  def total_price
    price * quantity
  end
  
end
