class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path(item_params)
  end

  def index
    @items = Item.all
  end

  def update
  end

 private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end
end