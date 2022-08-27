require 'rails_helper'
describe 'フードモデル機能', type: :model do
  let!(:user) { FactoryBot.create(:user) }
  describe 'バリデーションのテスト' do
    context '商品名が未記入の場合' do
      it 'バリデーションにひっかかる' do
        food = Food.new(name: '', due_time: '2022/08/07 08:00', user: user)
        expect(food).not_to be_valid
      end
    end
    context '期限が未記入の場合' do
      it 'バリデーションにひっかかる' do
        food = Food.new(name: 'お肉', due_time: '', user: user)
        expect(food).not_to be_valid    
      end
    end
    context '商品名と期限が記入された場合' do
      it 'バリデーションが通る' do
        food = Food.new(name: 'お肉', due_time: '2022/08/08 09:00', user: user)
        expect(food).to be_valid
      end
    end
  end
end