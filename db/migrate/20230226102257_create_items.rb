class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name, null: false
      t.text       :guid, null: false
      t.integer    :status_id, null: false
      t.integer    :costs_allocation_id, null: false
      t.integer    :delivery_day_id, null: false
      t.integer    :price, null: false
      t.references :user, null: false, foreign_key: true
      t.integer    :category_id, null: false
      t.integer    :prefecture_id,  null: false
      t.timestamps
    end
  end
end
