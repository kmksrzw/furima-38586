class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :tel, :user_id, :item_id
  attr_accessor :token

  with_options presence: true do
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :tel, format: {with: /\A\d{10,11}\z/, message: 'is invalid'}
    validates :city, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :house_number
    validates :user_id
    validates :item_id
    validates :token
  end
validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存,order_idには、変数orderのidを指定する
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, tel: tel, order_id: order.id)
  end

end
