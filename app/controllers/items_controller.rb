class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @items = Item.new 
  end

  def create 
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_fee_id, :country_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end


end
