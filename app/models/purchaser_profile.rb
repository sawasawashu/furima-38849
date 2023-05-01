class PurchaserProfile
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :municipality, :address, :telephone_number, :user_id, :item_id
end