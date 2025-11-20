# app/admin/categories.rb
ActiveAdmin.register Category do
  permit_params :name
end
