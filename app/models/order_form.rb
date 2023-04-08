class OrderForm
  include ActiveModel::Model
  
  attr_accessor :user_id, :item_id, :zip_code, :prefecture_id, :city, :address, :building, :telephone

  # 4行目と同じくこのタイミングでは生成前なので「validates :order_id」は不要
  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :item_id
    # deliver_addressモデルのバリデーション
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :telephone, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    # トークンのバリデーション
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    # ストロングパラメーターでデータが運ばれ、それらが保存のタイミングで「order_id」が生成され、保存される。
    DeliverAddress.create(order_id: order.id, zip_code: zip_code, prefecture_id: prefecture_id, city: city, address: address, building: building, telephone: telephone)
  end
end