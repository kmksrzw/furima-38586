class DonationAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :tel, :user_id, :item_id,

  with_options presence: true do
    # 数字3桁、ハイフン、数字4桁の並びのみ許可する
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    # 電話番号(ハイフンなし10桁or11桁)
    validates :tel, numericality: {only_integer: true, with: /\A\d{10,11}\z/, message: 'is invalid'}
    # ひらがな、カタカナ、漢字のみ許可する
    validates :city, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid. Input full-width characters."}
    validates :house_number
    validates :user_id
    validates :item_id
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存,order_idには、変数orderのidを指定する
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, tel: tel, order_id: order.id)
  end

end
