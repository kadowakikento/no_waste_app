class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 

  def index
    @shopping_lists = current_user.shopping_lists.all
  end

  def show
    @comments = @shopping_list.comments
    @comment = @shopping_list.comments.build
  end

  def new
    @shopping_list = ShoppingList.new
  end

  def edit
  end

  def create
    @shopping_list = ShoppingList.new(shopping_list_params)
    if @shopping_list.save
      redirect_to @shopping_list, notice: '買い物リストに追加しました'
    else
      render :new
    end
  end

  def update
    if @shopping_list.update(shopping_list_params)
      redirect_to @shopping_list, notice: '変更しました'
    else
      render :edit
    end
  end

  def destroy
    @shopping_list.destroy
    redirect_to shopping_lists_url, notice: '買い物リストから削除しました'
  end

  private

  def set_shopping_list
    @shopping_list = ShoppingList.find(params[:id])
  end

  def shopping_list_params
    params.require(:shopping_list).permit(:title, :content, :user_id)
  end
end
