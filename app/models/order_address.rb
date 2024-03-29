class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は-(ハイフン)を含む形で入力して下さい' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してして下さい' }
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :phone_number, format: { with: /\A[0-9]{10,11}\z/ }
    validates :block, :user_id, :item_id, :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block, building: building,
                   phone_number: phone_number, order_id: order.id)
  end
end
