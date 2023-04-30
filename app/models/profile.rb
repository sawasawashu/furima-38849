class Profile < ApplicationRecord
  belongs_to :purchaser

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region

  validates :postal_code, presence: true, format: {with: /\A\d{7}\z/}
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipality, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
end
