class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    @items = Item.all
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

  def edit
  end

  def show
  end

private
  def item_params
    params.require(:item).permit(:name, :explanation, :price, :user, :image, :category_id, :cost_id, :shipment_id, :source_id, :status_id).merge(user_id: current_user.id)
  end
end
