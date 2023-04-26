class ItemsController < ApplicationController
  before_action :move_to_login, only: :new
  before_action :authenticate_user!, only: :edit
  before_action :move_to_index, only: :edit
  before_action :set_item, only: [:show, :edit, :update]

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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path, method: :get
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :introduction, :category_id, :status_id, :charge_id, :region_id, :delivery_day_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def move_to_login
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def move_to_index
    @item = Item.find(params[:id])
    return if current_user == @item.user

    redirect_to action: :index
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
