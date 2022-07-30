class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  validates :image, presence: true
  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  with_options presence: true do
    validates :category_id, :item_status_id, :prefecture_id, :shipping_cost_id, :shipping_date_id
  end

  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :category_id, numericality: { other_than: 1 }
  validates :item_status_id, numericality: { other_than: 1 }
  validates :shipping_cost_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 0  }
  validates :shipping_date_id, numericality: { other_than: 1 }
end
