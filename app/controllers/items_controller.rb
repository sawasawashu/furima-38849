class ItemsController < ApplicationController
  before_action :move_to_login, only: :new

  def index
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

  private

  def item_params
    params.require(:item).permit(:product_name, :introduction, :category_id, :status_id, :charge_id, :region_id, :delivery_day_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def move_to_login
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
