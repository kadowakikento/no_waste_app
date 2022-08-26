require 'rails_helper'
describe 'ショッピングリストモデル機能', type: :model do
  let!(:user) { FactoryBot.create(:user) }
  describe 'バリデーションのテスト' do
    context '備考は記入されたが商品名が未記入の場合' do
      it 'バリデーションにひっかかる' do
        shopping_list = ShoppingList.new(title: '', content: 'must', user: user)
        expect(shopping_list).not_to be_valid
      end
    end
    context '商品名が記入された場合' do
      it 'バリデーションが通る' do
        shopping_list = ShoppingList.new(title: 'お魚', user: user)
        expect(shopping_list).to be_valid
      end
    end
  end
end
