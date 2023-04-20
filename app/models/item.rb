class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :region
  belongs_to :delivery_day

  validates :product_name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999},format: { with: /\A\d+\z/ }
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :charge_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :region_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :delivery_day_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :image, presence: true
end