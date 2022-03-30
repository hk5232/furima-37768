class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :item_set, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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

  def edit
    if !user_signed_in?
      redirect_to new_user_session_path
    elsif user_signed_in? && !(current_user == @item.user)
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user == @item.user
    @item.destroy
    redirect_to root_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :explanation, :price, :image, :category_id, :cost_id, :shipment_id, :source_id,
                                 :status_id).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end
end
