class ProductsController < ApplicationController
  def index
    @search = params[:search].to_s.strip
    @category_id = params[:category_id].presence

    scope = Product.includes(:category).order(:name)

    if @search.present?
      query = "%#{@search}%"
      scope = scope.where("products.name LIKE ? OR products.description LIKE ?", query, query)
    end

    if @category_id
      scope = scope.where(category_id: @category_id)
    end

    @products = scope.page(params[:page]).per(10)
    @categories = Category.order(:name)
  end

    def show
    @product = Product.includes(:category).find(params[:id])
    end
end
