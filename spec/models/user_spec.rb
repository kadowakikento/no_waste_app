require 'rails_helper'
describe 'ユーザーモデルのバリデーションテスト', type: :model do
  it 'Eメールの入力欄が空の場合、バリデーションにひっかかる' do
    user = User.new(email: '', password: '12345678', password_confirmation: '12345678')
    expect(user).not_to be_valid
  end
  it '全ての項目が入力されていれば、登録できる' do
    user = User.new(email: 'test@email.com', password: '12345678', password_confirmation: '12345678')
    expect(user).to be_valid
  end
end
