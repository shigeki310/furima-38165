class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image, :title, :description, :price
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :category_id, :item_status_id, :prefecture_id, :shipping_cost_id, :shipping_date_id
  end

  belongs_to :category_id
  belongs_to :item_status_id
  belongs_to :shipping_cost_id
  belongs_to :prefecture_id
  belongs_to :shipping_date_id

  validates :category_id, numericality: { other_than: 1 , message: "can't be blnak" }
  validates :item_status_id, numericality: { other_than: 1 , message: "can't be blnak" }
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blnak" }
  validates :prefecture_id, numericality: { other_than: 0 , message: "can't be blnak" }
  validates :shipping_date_id, numericality: { other_than: 1 , message: "can't be blnak" }
end
