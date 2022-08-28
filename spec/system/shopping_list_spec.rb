require 'rails_helper'

RSpec.describe '買い物リストの機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:second_user) { FactoryBot.create(:second_user) }
  let!(:shopping_list) { FactoryBot.create(:shopping_list, user: user) }
  let!(:second_shopping_list) { FactoryBot.create(:second_shopping_list, user: user) }

  describe '買い物リストのCRUD機能' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test1@test.com'
      fill_in 'user[password]', with: '12345678'
      click_button 'ログイン'
    end
    context '買い物リストを新規作成した場合' do
      it '買い物リストに追加される' do
        click_link '買い物リスト'
        click_link 'リスト追加'
        fill_in 'shopping_list[title]', with: '白米'
        fill_in 'shopping_list[content]', with: 'must'
        click_button '追加'
        expect(page).to have_content '追加しました'
      end
    end
    context '商品を編集した場合' do
      it '編集した商品が表示される' do
        visit shopping_lists_path
        click_on '編集', match: :first
        fill_in 'shopping_list[title]', with: 'ご飯'
        fill_in 'shopping_list[content]', with: 'want'
        click_button '更新'
        expect(page).to have_content '変更しました'
      end
    end
    context '商品を削除した場合' do
      it '買い物リストから商品がなくなる' do
        click_link '買い物リスト'
        click_on '削除', match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '削除しました'
      end
    end
    context '商品の詳細を押した場合' do
      it '商品の詳細を見られる' do
        click_link '買い物リスト'
        click_on '詳細', match: :first
        expect(page).to have_content '商品'
      end
    end
  end
end

