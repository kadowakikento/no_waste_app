class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "ユーザー情報を編集しました！"
      else
      render :edit, notice: "更新に失敗しました！"
    end
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :image, :image_cache)
  end
end
