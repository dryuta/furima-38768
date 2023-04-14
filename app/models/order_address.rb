class OrderAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :address, :building, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :telephone, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
  end

  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(user_id: user_id, item_id:item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    DeliverAddress.create(order_id: order.id, zip_code: zip_code, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone: telephone)
  end
end
