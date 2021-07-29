class CategoriesController < ApplicationController
  
  def index
    @count = 0
    @categories = Category.where(user_id: current_user.id)
    @category = Category.new
  end

  def create
    @category = current_user.categories.new(category_params)
    if @category.save
      redirect_to categories_path
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:category)
  end

end
