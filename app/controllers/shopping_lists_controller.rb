class ShoppingListsController < ApplicationController
  before_action :set_shopping_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 

  # GET /shopping_lists
  def index
    @shopping_lists = current_user.shopping_lists.all
  end

  # GET /shopping_lists/1
  def show
  end

  # GET /shopping_lists/new
  def new
    @shopping_list = ShoppingList.new
  end

  # GET /shopping_lists/1/edit
  def edit
  end

  # POST /shopping_lists
  def create
    @shopping_list = ShoppingList.new(shopping_list_params)

    if @shopping_list.save
      redirect_to @shopping_list, notice: 'Shopping list was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /shopping_lists/1
  def update
    if @shopping_list.update(shopping_list_params)
      redirect_to @shopping_list, notice: 'Shopping list was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /shopping_lists/1
  def destroy
    @shopping_list.destroy
    redirect_to shopping_lists_url, notice: 'Shopping list was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_list
      @shopping_list = ShoppingList.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shopping_list_params
      params.require(:shopping_list).permit(:title, :content, :user_id)
    end
end
