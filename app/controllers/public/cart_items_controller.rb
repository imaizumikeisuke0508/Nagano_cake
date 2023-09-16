class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total = 0
  end

  def update
  end

  def create
    @cart_item = CartItem.new(cart_items_params)
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
  end

  private
  def cart_items_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
