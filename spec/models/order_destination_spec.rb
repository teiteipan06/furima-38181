require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_destination = FactoryBot.build(:order_destination, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品の購入' do
    context '購入できるとき' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@order_destination).to be_valid
      end
      it "建物名が空の場合でも保存できること" do
        @order_destination.building_name = nil
        expect(@order_destination).to be_valid
      end
    end

    context '商品を購入できないとき' do
      it '郵便番号が空では登録できないこと' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_destination.post_code = '123ー4567'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が1では保存できないこと' do
        @order_destination.country_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Country must be other than 1")
      end
      it '市区町村が空では保存できないこと' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できないこと' do
        @order_destination.banchi = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Banchi can't be blank")
      end
      it '電話番号が空では保存できないこと' do
        @order_destination.phone_number = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order_destination.phone_number = '00000000aaa'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上だと購入できない' do
        @order_destination.phone_number = '000000000000'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が9桁以下だと購入できない' do
        @order_destination.phone_number = '00000000'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号にハイフンが入っていると購入できないこと' do
        @order_destination.phone_number = "0#{rand(0..9)}0-#{rand(1_000_000..99_999_999)}"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it "カード情報が空では登録できないこと" do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
      it "ユーザー情報が空では登録できないこと" do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
      it "商品情報が空では登録できないこと" do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end