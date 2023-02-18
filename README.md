# テーブル設計

## usersテーブル
| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| email               | string | null: false |メール
| encrypted_password  | string | null: false |パスワード
| nickname            | string | null: false |ニックネーム
| first_name          | string | null: false |氏（全角）
| last_name           | string | null: false |名(全角）
| first_name_kana     | string | null: false |氏カナ（全角）
| last_name_kana      | string | null: false |名カナ（全角）
| birthday            | date   | null: false |誕生日

### Association
- has_many :products
- has_many :purchase
  has_many :delivery

## 商品テーブル (product)
画像    image
商品名  name
商品説明 guid
カテゴリ category
状態    status
配送料負担 deliv_load
発送元地域 deliv_area
発送日数  deliv_days
金額    price
出品者ID(user_ID)

### Association
- bolongs_to :purchase,
- has_many :user

## 購入テーブル（purchase）
購入者（user_ID）
購入日
クレジットカード番号
有効期限
セキュリティコード 
商品ID (product_ID)
配送先ID

### Association
- belongs_to :product
  belongs_to :delivery
  has_many :user


## 配送先データ(delivery)
購入品(purchase_id)
郵便番号
都道府県
市区町村
番地
建物
電話番号

### Association
- bolongs_to :purchase
