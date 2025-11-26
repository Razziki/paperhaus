# app/admin/products.rb
ActiveAdmin.register Product do
  permit_params :name, :author, :description, :price_cents, :currency, :category_id

  filter :name
  filter :author
  filter :category

  remove_filter :order_items
end
