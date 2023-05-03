require 'rails_helper'

RSpec.describe PurchaserProfile, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchaser_profile = FactoryBot.build(:purchaser_profile, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品を購入できる' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@purchaser_profile).to be_valid
      end

      it 'buiding_nameが空でも購入できる' do
        @purchaser_profile.building_name = ''
        expect(@purchaser_profile).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空では購入できない' do
        @purchaser_profile.postal_code = ''
        @purchaser_profile.valid?
        expect(@purchaser_profile.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end

      it 'postal_codeはハイフンを含んだ正しい形式でないと購入できない' do
        @purchaser_profile.postal_code = '1234567'
        @purchaser_profile.valid?
        expect(@purchaser_profile.errors.full_messages).to include("Postal code is invalid")
      end

      it 'region_idが1では購入できない' do
        @purchaser_profile.region_id = 1
        @purchaser_profile.valid?
        expect(@purchaser_profile.errors.full_messages).to include("Region can't be blank")
      end

      it 'municipalityが空では購入できない' do
        @purchaser_profile.municipality = ''
        @purchaser_profile.valid?
        expect(@purchaser_profile.errors.full_messages).to include("Municipality can't be blank")
      end

      it 'addressが空では購入できない' do
        @purchaser_profile.address = ''
        @purchaser_profile.valid?
        expect(@purchaser_profile.errors.full_messages).to include("Address can't be blank")
      end

      it 'telephone_numberが空では購入できない' do
        @purchaser_profile.telephone_number = ''
        @purchaser_profile.valid?
        expect(@purchaser_profile.errors.full_messages).to include("Telephone number can't be blank", "Telephone number is invalid")
      end

      it 'telephone_numberは9桁以下では購入できない' do
        @purchaser_profile.telephone_number = '080000000'
        @purchaser_profile.valid?
        expect(@purchaser_profile.errors.full_messages).to include("Telephone number is invalid")
      end

      it 'telephone_numberは12桁以上では購入できない' do
        @purchaser_profile.telephone_number = '08091999020300'
        @purchaser_profile.valid?
        expect(@purchaser_profile.errors.full_messages).to include("Telephone number is invalid")
      end

      it 'telephone_numberは半角数字でないと購入できない' do
        @purchaser_profile.telephone_number = '０８０９８８８６５４３'
        @purchaser_profile.valid?
        expect(@purchaser_profile.errors.full_messages).to include("Telephone number is invalid")
      end

      it 'userが紐づいていいないと購入できない' do
        @purchaser_profile.user_id = nil
        @purchaser_profile.valid?
        expect(@purchaser_profile.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいていないと購入できない' do
        @purchaser_profile.item_id = nil
        @purchaser_profile.valid?
        expect(@purchaser_profile.errors.full_messages).to include("Item can't be blank")
      end

    end
  end

end
