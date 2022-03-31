class BuysController < ApplicationController
  before_action :item_set, only: [:index, :create]
  before_action :skip_user, unless: proc { user_signed_in? }
  before_action :skip_user, if: proc { user_signed_in? && current_user.id == @item.user.id? }


  def index
    @buy_address = BuyAddress.new
    if @item.buy.present?
      redirect_to root_path
    end
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
     if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:buy_address).permit(:postal_code, :source_id, :address_city, :address_street, :address_building, :phone_number, :token).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_set
    @item = Item.find(params[:item_id])
  end

  def skip_user
    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: buy_params[:token],   
        currency: 'jpy'                
      )
  end
end
