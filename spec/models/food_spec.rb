require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'バリデーションのテスト' do
    context '商品名が未記入の場合' do
      it 'バリデーションにひっかかる' do
        empty_name = FactoryBot.build(:food, name: nil)
        expect(empty_name).not_to be_valid
      end
    end
    context '期限が未記入の場合' do
      it 'バリデーションにひっかかる' do
        empty_due_time = FactoryBot.build(:food, due_time: nil)
        expect(empty_due_time).not_to be_valid    
      end
    end
    context '商品名と期限が記入された場合' do
      it 'バリデーションが通る' do
        enough_food = FactoryBot.build(:food)
        expect(enough_food).to be_valid
      end
    end
  end
  # end

  # it '商品名と期限が記入されていたらバリデーションに通る' do
  #   food = Food.new(name: 'お肉', due_time: '2022/08/07 08:00', user_id: 1)
  #   expect(food).to be_valid
  # end

end