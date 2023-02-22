## usersテーブル(ユーザー情報)				
Column            |Type	 |Options		
----------------------------------------
email             |string|null: false	|	アドレス
encrypted_password|string|null: false	|	パスワード
nickname          |string|null: false	|	ニックネーム
first_name	      |string|null: false	|	氏（全角）
last_name	        |string|null: false	|	名（全角）
first_name_kana   |string|null: false	|	氏カナ（全角）
last_name_kana    |string|null: false	|	名カナ（全角）
birthday	        |date	 |null: false	|	誕生日
						
### Assosiation						
has_many :items				
has_many :purchse				
						
						
## itemテーブル(商品情報)				
Column	         |Type	    |Options		
-----------------------------------------------------------	
itemname	       |string	  |null: false	                 |商品名
guid	           |string	  |null: false	                 |商品説明
status_id	       |string	  |null: false	                 |状態
costs_allocation |string	  |null: false	                 |配送料負担
days	           |string	  |null: false	                 |発送日数
price	           |integer	  |null: false	                 |金額
user_id	         |references|null: false, foreign_key: true|出品者（ユーザー）
category_id	     |references|null: false, foreign_key: true|カテゴリ
prefectures_id	 |references|null: false, foreign_key: true|発送元地域
						
### Assosiation						
has_one_attached :image	## chatapp画像投稿機能を参照		
has_one	    :purchse				
belings_to	:user				
belings_to	:status				
belings_to	:category				
belings_to	:prefectures				
						
## purchase テーブル(購入情報)				
Column	 |Type	    |Options		
----------------------------------------------------						
item_id  |references|null: false, foreign_key: true	|商品情報ID
user_id  |references|null: false, foreign_key: true	|ユーザーID
card_id  |references|null: false, foreign_key: true	|クレカ情報ID
adress_id|references|null: false, foreign_key: true	|配送先ID
						
### Assosiation						
has_one	   :item				
has_one	   :card				
has_one	   :adress				
belings_to :user				
						
## card テーブル(クレカ情報)				
Column	     |Type	    |Options		
--------------------------------------------------------						
number	     |integer	  |null: false	                  |カード番号
expiration_yy|integer	  |null: false	                  |期限（YY）
expiration_mm|integer	  |null: false	                  |期限（MM）
sequlity_cd	 |integer	  |null: false	                  |ｾｷｭﾘﾃｨｰｺｰﾄﾞ
purchase_id	 |references|null: false, foreign_key: true	|購入情報ID
						
### Assosiation						
has_one	:purchase				
						
## card テーブル(配送先)				
Column	      |Type	     |Options		
--------------------------------------------------------						
post_id	      |integer	 |null: false	                  |郵便番号
prefectures_id|references|null: false, foreign_key: true|都道府県ID
city	        |string	   |null: false	                  |市区町村
number	      |string	   |null: false	                  |番地
building	    |string	   |		                          |建物(任意)
tel	          |integer	 |null: false	                  |電話番号
purchase_id	  |references|null: false, foreign_key: true|購入情報ID
						
### Assosiation						
has_one	   :purchase				
belings_to :prefectures				
						
## status テーブル(商品状態)				
Column |Type   |Options		
-----------------------------						
status |string | null: false |状態名
						
### Assosiation						
has_many :items				
						
## category テーブル(カテゴリ)				
Column	|Type	|Options
-----------------------------
category|string	|null: false |カテゴリ名
						
### Assosiation						
has_many :items				
						
## prefectures テーブル(都道府県)				
Column	    |Type	|Options	  
--------------------------------						
prefectures	|string	|null: false | 都道府県名
						
### Assosiation						
has_many :items				
has_many :adress
