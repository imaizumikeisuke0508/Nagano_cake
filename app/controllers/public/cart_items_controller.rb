class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @total = 0
  end

  def create
    item_id = cart_items_params[:item_id]
    if CartItem.find_by(item_id: item_id)
      @cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.update(amount: @cart_item.amount)
    else
      @cart_item = CartItem.new(cart_items_params)
      @cart_item.save
    end
    redirect_to public_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    redirect_to public_items_path
  end

  private
  def cart_items_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end
end
