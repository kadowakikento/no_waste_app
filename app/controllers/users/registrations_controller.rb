# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]
  before_action :ensure_admin_user, only: %i[update destroy]

  def ensure_normal_user
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーの更新・削除はできません。'
    end
  end

  def ensure_admin_user
    if resource.email == 'admin_guest@guest.com'
      redirect_to root_path, alert: 'ゲスト管理者は削除できません'
    end
  end

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
  end

  # PUT /resource
  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "ユーザー情報を編集しました！"
    else
      render :edit, notice: "更新に失敗しました！"
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
  private

  def user_params
    params.require(:user).permit(:name, :email, :image) 
  end
end
