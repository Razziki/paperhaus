class CartsController < ApplicationController
  def show
    @cart = cart_items
  end

  def add
    product_id = params[:product_id].to_s
    cart = session[:cart] || {}
    cart[product_id] = (cart[product_id] || 0) + 1
    session[:cart] = cart
    redirect_to cart_path, notice: "Product added to cart!"
  end

  def update
    product_id = params[:product_id].to_s
    quantity = params[:quantity].to_i
    cart = session[:cart] || {}
    if quantity > 0
      cart[product_id] = quantity
    else
      cart.delete(product_id)
    end
    session[:cart] = cart
    redirect_to cart_path, notice: "Cart updated"
  end

   def remove
    product_id = params[:product_id].to_s
    cart = session[:cart] || {}
    cart.delete(product_id)
    session[:cart] = cart
    redirect_to cart_path, notice: "Item removed"
   end

  private

  def cart_items
    (session[:cart] || {}).map do |product_id, qty|
      product = Product.find(product_id)
      [ product, qty ]
    end
  end
end
