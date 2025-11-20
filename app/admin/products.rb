# app/admin/products.rb
ActiveAdmin.register Product do
  permit_params :name,
                :author,
                :description,
                :price_cents,
                :currency,
                :category_id
end
