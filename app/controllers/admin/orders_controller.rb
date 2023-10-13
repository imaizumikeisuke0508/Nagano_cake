class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @orders.each do |order|
    @total = 0
    @order_detail = OrderDetail.where(order_id: order.id)
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.where(order_id: @order.id)
    @total = 0
    @order_detail.each do |order_detail|
     @total += order_detail.subtotal
    end
  end
end
