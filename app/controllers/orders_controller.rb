class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :contributor_confirmation

  def index
    @order_destination = OrderDestination.new
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_item
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
    params.require(:order_destination).permit(:post_code, :country_id, :city, :banchi, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def contributor_confirmation
    redirect_to root_path if current_user.id == @item.user.id
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  
      card: params[:token],    
      currency: 'jpy'                 
    )
  end
end
