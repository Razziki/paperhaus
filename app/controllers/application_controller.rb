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
    (session[:cart] || {}).map do |product_id, qty|
      product = Product.find(product_id)
      [ product, qty ]
    end
  end
end
