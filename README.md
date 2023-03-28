## usersテーブル(ユーザー情報)				
| Column             | Type	  | Options                   |
| ------------------ | ------ | ------------------------- |	
| email              | string | null: false, unique:true	|	アドレス
| encrypted_password | string | null: false	              |	パスワード
| nickname           | string | null: false	              |	ニックネーム
| first_name	       | string | null: false	              |	氏（全角）
| last_name	         | string | null: false	              |	名（全角）
| first_name_kana    | string | null: false	              |	氏カナ（全角）
| last_name_kana     | string | null: false	              |	名カナ（全角）
| birthday	         | date	  | null: false	              |	誕生日

### Assosiation
has_many :items
has_many :orders


## itemsテーブル(商品情報)
| Column	            | Type       | Options                        |	
| ------------------- | ---------- | ------------------------------ |	
| item_name	          | string     | null: false	                  | 商品名
| guid	              | text  	   | null: false	                  | 商品説明
| status_id	          | integer    | null: false	                  | 状態 #ActiveHash
| costs_allocation_id | integer    | null: false	                  | 配送料負担 #ActiveHash
| delivery_day_id     | integer    | null: false	                  | 発送日数 #ActiveHash
| price	              | integer	   | null: false	                  | 金額
| user  	            | references | null: false, foreign_key: true | 出品者（ユーザー）
| category_id	        | integer    | null: false                    | カテゴリ #ActiveHash
| prefecture_id	      | integer    | null: false                    | 発送元地域 #ActiveHash

### Assosiation
has_one     :order
belongs_to	:user


## ordersテーブル(購入情報)
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true | 商品情報ID
| user    | references | null: false, foreign_key: true | ユーザーID

### Assosiation
has_one	   :address
belongs_to :item
belongs_to :user


## addressesテーブル(配送先)
| Column  	     | Type	      | Options	                       |	
| -------------- | ---------- | ------------------------------ |
| post_code      | string 	  | null: false	                   | 郵便番号
| prefecture_id  | integer    | null: false                    | 都道府県 #Activehash
| city	         | string	    | null: false	                   | 市区町村
| house_number   | string	    | null: false	                   | 番地
| building_name  | string	    |		                             | 建物(任意)
| tel	           | string     | null: false	                   | 電話番号
| order   	     | references | null: false, foreign_key: true | 購入情報ID

### Assosiation
belongs_to :order