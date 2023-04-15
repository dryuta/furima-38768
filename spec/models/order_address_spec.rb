require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.build(:user)
    user.id = 1
    item = FactoryBot.build(:item)
    item.id = 1
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_address.user_id = 1
        expect(@order_address).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_address.item_id = 1
        expect(@order_address).to be_valid
      end
      it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @order_address.zip_code = '123-4560'
        expect(@order_address).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @order_address.prefecture_id = 1
        expect(@order_address).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_address.city = '横浜市'
        expect(@order_address).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_address.address = '旭区１２３'
        expect(@order_address).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_address.building = nil
        expect(@order_address).to be_valid
      end
      it '電話番号が11桁なら保存できる' do
        @order_address.telephone = 12345678910
        expect(@order_address).to be_valid
      end
      it '電話番号が10桁なら保存できる' do
        @order_address.telephone = 1234567891
        expect(@order_address).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @order_address.zip_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code can't be blank", "Zip code is invalid. Include hyphen(-)")
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_address.zip_code = 1_234_567
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end
      it '都道府県が「---」だと保存できないこと' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @order_address.prefecture_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order_address.city = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_address.address = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_address.telephone = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid")
      end
      it '電話番号に半角数値外があると保存できないこと' do
        @order_address.telephone = '123 - 1234 - 1234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid")
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order_address.telephone = 123456789123
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid")
      end
      it '電話番号が９桁以下あると保存できないこと' do
        @order_address.telephone = 123456789
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone is invalid")
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
