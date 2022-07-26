class Order < ApplicationRecord
  belongs_to :user
  beromgs_to :item
  has_one :address
end
