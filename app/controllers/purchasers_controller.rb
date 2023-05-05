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
      pay_item
      @purchaser_profile.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_profile).permit(:postal_code, :region_id, :municipality, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: @item.id,token:params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_68ef7ecd00b102c810ac6acd"  
    Payjp::Charge.create(
      card: purchaser_params[:token],
      currency: 'jpy'
    )
  end

end
