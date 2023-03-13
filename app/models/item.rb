class Item < ApplicationRecord
  
  belongs_to :user
  
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :costs_allocation
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :delivery_day
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :status


  validates :item_name, :guid, :price,  presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :costs_allocation_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_day_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}

end
