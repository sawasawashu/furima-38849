class Profile < ApplicationRecord
  belongs_to :purchaser

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region

  postal_pattern = /\A\d{3}-\d{4}\z/
  validates :postal_code, presence: true, format: {with: postal_pattern}
  validates :region_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipality, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
end
