class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_user, :cart_items

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_login
    redirect_to new_session_path, alert: "Please log in to proceed" unless current_user
  end

  def authenticate_admin!
    unless current_user&.role == "admin"
      redirect_to root_path, alert: "Not authorized"
    end
  end

  # helper for the books in the cart
 def cart_items
  cart_hash = session[:cart] || {}
  items     = []

  cart_hash.each do |product_id, qty|
    product = Product.find_by(id: product_id)

    if product
      items << [product, qty]
    else
      cart_hash.delete(product_id)
    end
  end

  session[:cart] = cart_hash
  items
end

end
