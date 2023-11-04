class Public::OrdersController < ApplicationController
  def new
  end

  def confirm
    @order = Order.new(order_params)
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    @order.post_number = current_customer.postal_code
    @cart_items = CartItem.all
    @total = 0
    @cart_items.each do |cart_item|
     @total += cart_item.subtotal
    end
  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = CartItem.all
     @order_items = []
     @cart_items.each do |cart_item|
       order_detail = OrderDetail.new(
        order_id: @order.id,
        item_id: cart_item.item.id,
        price: cart_item.item.price,
        quantity: cart_item.amount
         )
      @order_items << order_detail
     end
   OrderDetail.import @order_items
   cart_items = CartItem.all
   cart_items.destroy_all
   redirect_to public_orders_thanks_path
  end

  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @total = 0
    @order_details.each do |order_detail|
      @total += order_detail.subtotal
    end
  end

private
 def order_params
   params.require(:order).permit(:post_number, :address, :payment_method, :name, :amount_billed, :customer_id, )
 end
 def order_detail_params
   params.require(:order_detail).permit(:price, :item_id, :order_id, :quantity)
 end
end