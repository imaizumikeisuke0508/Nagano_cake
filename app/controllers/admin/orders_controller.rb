class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @total = 0
  end

  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.all
    @total = 0
    @order_detail.each do |order_detail|
     @total += order_detail.subtotal
    end
  end
end
