class OrdersController < ApplicationController
  before_action :require_login

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def new
    if cart_empty?
      redirect_to root_path, alert: "Your cart is empty." and return
    end

    @order = Order.new
  end

  def create
    if cart_empty?
      redirect_to root_path, alert: "Your cart is empty." and return
    end

    ActiveRecord::Base.transaction do
      @order = current_user.orders.build
      @order.province = current_user.province

      build_order_items_from_cart(@order)

      @order.recalc_totals!
      @order.save!

      clear_cart!
    end

    redirect_to @order, notice: "Order placed!"
  rescue ActiveRecord::RecordInvalid
    flash.now[:alert] = "There was a problem placing your order."
    render :new, status: :unprocessable_entity
  end

  private

  def build_order_items_from_cart(order)
    cart_items.each do |product, qty|
      order.order_items.build(
        product:      product,
        quantity:     qty,
        unit_price:   product.price,
        name_snapshot:  product.title,
        price_snapshot: product.price
      )
    end
  end

  def cart_empty?
    (session[:cart] || {}).empty?
  end

  def clear_cart!
    session[:cart] = {}
  end
end
