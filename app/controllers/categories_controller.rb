class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  # GET /categories or /categories.json
  def index
    @user = current_user
    @categories = current_user.categories
  end

  # GET /categories/1 or /categories/1.json
  def show; end

  # GET /categories/new
  def new
    @user = current_user
    @category = Category.new
  end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.create(category_params)
    if @category.save
      flash[:success] = 'Category created succesfully'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = 'Category deleted successfully'
    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon, :user_id)
  end
end
