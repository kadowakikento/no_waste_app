require 'rails_helper'

RSpec.describe '冷蔵庫の機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  let!(:food) { FactoryBot.create(:food, user: user) }
  let!(:second_food) { FactoryBot.create(:second_food, user: user) }

  describe '冷蔵庫のCRUD機能' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test1@test.com'
      fill_in 'user[password]', with: '12345678'
      click_button 'ログイン'
    end
    context '商品を新規作成した場合' do
      it '商品が追加される' do
        click_link '冷蔵庫一覧'
        click_link '冷蔵庫に追加'
        fill_in 'food[name]', with: 'test'
        fill_in 'food[due_time]', with: '002022-08-25-16:30'
        click_button '追加'
        expect(page).to have_content '追加しました'      
      end
    end
    context '商品を編集した場合' do
      it '編集した商品が表示される' do
        visit foods_path
        click_on '編集', match: :first
        fill_in 'food[name]', with: 'test2'
        fill_in 'food[due_time]', with: '002022-08-27-11:11'
        click_button '更新'
        expect(page).to have_content '更新しました'
      end
    end
    context '商品を削除した場合' do
      it '商品がなくなる' do
        click_link '冷蔵庫一覧'
        click_on '削除', match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '削除しました'
      end
    end
    context '商品名を検索した時に' do
      it '商品名に一致する' do
        click_link '冷蔵庫一覧'
        fill_in 'q[name_cont]', with: 'お肉'
        click_button '検索', match: :first
        expect(page).to have_content 'お肉'
      end
    end
    context 'ソートした場合' do
      it '期限の古い順で表示する' do
        visit foods_path
        click_link '期限'
        expect(Food.order("created_at DESC").map(&:due_time)).to eq ['2022-08-28 01:30:00.000000000 +0900', '2022-08-29 16:30:00.000000000 +0900']
      end
    end
  end
end
