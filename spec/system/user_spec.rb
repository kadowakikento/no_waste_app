require 'rails_helper'
RSpec.describe 'ユーザ登録、セッション機能、管理画面のテスト', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  describe 'ユーザー機能' do
    context 'ユーザーを新規作成した場合' do
      it 'ユーザーの新規登録ができる' do
        visit new_user_registration_path
        fill_in 'user[email]', with: 'test@test.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました'
      end
    end

    context '登録した情報でログインした場合' do
      it 'ログインができる' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'test1@test.com'
        fill_in 'user[password]', with: '12345678'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました'
      end

      it 'マイページに遷移する' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'test1@test.com'
        fill_in 'user[password]', with: '12345678'
        click_button 'ログイン'
        expect(page).to have_content 'マイページ'
      end
    end

    context 'ログアウトをした場合' do
      it 'ログアウトしてログイン画面に遷移する' do
        visit new_user_session_path
        fill_in 'user[email]', with: 'test1@test.com'
        fill_in 'user[password]', with: '12345678'
        click_button 'ログイン'
        click_on 'ログアウト'
        expect(page).to have_content 'ログアウトしました'
      end
    end
    context 'ログインせずに冷蔵庫一覧に遷移した場合' do
      it 'ログイン画面に遷移させる' do
        visit foods_path
        expect(page).to have_content 'ログインもしくはアカウント登録してください'
      end
    end
    context 'ログインせずに買い物リストに遷移した場合' do
      it 'ログイン画面に遷移させる' do
        visit shopping_lists_path
        expect(page).to have_content 'ログインもしくはアカウント登録してください'
      end
    end
  end
end