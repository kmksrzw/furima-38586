require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の登録' do
    context '登録できる場合' do
      it "全項目が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '登録できない場合' do
      it "画像が空では登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "item_nameが空では登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it "guidが空では登録できない" do
        @item.guid = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Guid can't be blank"
      end
      it 'priceが空では登録できない' do
        @item.price = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceに半角数字以外が含まれている場合は出品できない' do
        @item.price = '９９'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'priceが300円未満では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it 'priceが9_999_999円を超えると出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it "status_idが空では登録できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it "status_idが1では登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'costs_allocation_idが空では登録できない' do
        @item.costs_allocation_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Costs allocation can't be blank"
      end
      it 'costs_allocation_idが1では登録できない' do
        @item.costs_allocation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Costs allocation can't be blank"
      end
      it 'delivery_day_idが空では登録できない' do
        @item.delivery_day_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end
      it 'delivery_day_idが1では登録できない' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery day can't be blank"
      end
      
      it 'category_idが空では登録できない' do
        @item.category_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      
    
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

    end
  end
end
