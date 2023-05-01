class PurchaserProfile
  include ActiveModel::Model
  attr_accessor :postal_code, :region_id, :municipality, :address, :building_name, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A\d{7}\z/}
    validates :municipality
    validates :address
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
  end
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchaser = Purchaser.create(user_id: user_id, item_id: item_id)

    profile = Profile.create(postal_code: postal_code, region_id: region_id, municipality: municipality,address: address, building_name: building_name, telephone_number: telephone_number, purchaser_id: purchaser_id)
  end
  
end

