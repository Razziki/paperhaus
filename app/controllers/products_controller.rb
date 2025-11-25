class ProductsController < ApplicationController
  def index
    @products = Product
                  .includes(:category)
                  .order(:name)
                  .page(params[:page])
                  .per(3)
  end

  def show
    @product = Product.includes(:category).find(params[:id])
  end
end
