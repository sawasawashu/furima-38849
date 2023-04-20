require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の出品' do
    context '商品を出品できる' do
      it "image,product_name,introduction,category_id,status_id,charge_id,region_id,delivery_day_id,priceの値が存在すれば出品できる" do
       expect(@item).to be_valid
      end 
    end
  end
end
