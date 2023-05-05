class Profile < ApplicationRecord
  belongs_to :purchaser

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region
end
