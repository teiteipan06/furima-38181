class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_item, only: [:show]


  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new 
  end

  def create 
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end


  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_fee_id, :country_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
