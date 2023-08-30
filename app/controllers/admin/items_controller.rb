class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
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
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(params[:id])
  end

 private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end
end