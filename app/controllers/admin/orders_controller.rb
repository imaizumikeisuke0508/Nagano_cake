class Admin::OrdersController < ApplicationController
  def index
   @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
    @total = 0
    @order_details.each do |order_detail|
     @total += order_detail.subtotal
    end
  end
end
