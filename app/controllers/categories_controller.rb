class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name)
  end

   def show
    @category = Category.find(params[:id])
    @products = @category.products.order(:name).page(params[:page]).per(4)
   end
end
