require 'rails_helper'
describe 'コメントモデルのバリデーションテスト', type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:shopping_list) { FactoryBot.create(:shopping_list, user: user ) }
  it 'コメントが空の場合、バリデーションにひっかかる' do
    comment = Comment.create(content: '')
    expect(comment).not_to be_valid
  end
  it 'コメントが入力されていれば、登録できる' do
    comment = Comment.create(content: 'test', shopping_list: shopping_list)
    expect(comment).to be_valid
  end
end