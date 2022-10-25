class OrdersController < ApplicationController
  before_action :set_item

  def index
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_destination).permit(:post_code, :country_id, :city, :banchi, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end
