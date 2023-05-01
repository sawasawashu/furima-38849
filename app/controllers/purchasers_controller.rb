class PurchasersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :create]
  
  def index
    @item = Item.find(params[:item_id])
    @purchaser_profile = PurchaserProfile.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchaser_profile = PurchaserProfile.new(purchaser_params)
    if @purchaser_profile.valid?
      @purchaser_profile.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_profile).permit(:postal_code, :region_id, :municipality, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id)
  end

end
