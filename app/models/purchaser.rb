class Purchaser < ApplicationRecord
   has_one    :profile
   belongs_to :user
   belongs_to :item
end
