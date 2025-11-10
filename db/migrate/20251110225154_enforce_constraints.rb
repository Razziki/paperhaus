class EnforceConstraints < ActiveRecord::Migration[8.0]
  def change
    # USERS
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name,  false
    change_column_null :users, :email,      false
    change_column_null :users, :password_digest, false
    change_column_null :users, :role, false
    change_column_default :users, :role, "customer"
    add_index :users, :email, unique: true

    # CATEGORIES
    change_column_null :categories, :name, false

    # PRODUCTS
    change_column_null    :products, :name,        false
    change_column_default :products, :price_cents, 0
    change_column_null    :products, :price_cents, false
    change_column_default :products, :currency,    "CAD"
    change_column_null    :products, :currency,    false
    change_column_null    :products, :category_id, false
    add_foreign_key :products, :categories

    # ORDERS
    change_column_null :orders, :user_id,       false
    add_foreign_key :orders, :users
    change_column_default :orders, :status,         "pending"
    change_column_null    :orders, :status,         false
    change_column_default :orders, :payment_status, "unpaid"
    change_column_null    :orders, :payment_status, false
    [ :subtotal_cents, :tax_cents, :shipping_cents, :total_cents ].each do |c|
      change_column_default :orders, c, 0
      change_column_null    :orders, c, false
    end
    change_column_default :orders, :currency, "CAD"
    change_column_null    :orders, :currency, false

    # ORDER ITEMS
    change_column_null    :order_items, :order_id,   false
    change_column_null    :order_items, :product_id, false
    add_foreign_key :order_items, :orders
    add_foreign_key :order_items, :products
    change_column_null    :order_items, :name, false
    change_column_default :order_items, :unit_price_cents, 0
    change_column_null    :order_items, :unit_price_cents, false
    change_column_default :order_items, :currency, "CAD"
    change_column_null    :order_items, :currency, false
    change_column_default :order_items, :quantity, 1
    change_column_null    :order_items, :quantity, false
    change_column_default :order_items, :total_cents, 0
    change_column_null    :order_items, :total_cents, false
  end
end
