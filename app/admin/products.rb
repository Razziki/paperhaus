ActiveAdmin.register Product do
  permit_params :name, :author, :description, :price_cents, :currency, :category_id, :image

  filter :name
  filter :author
  filter :category

  remove_filter :order_items

  form do |f|
    f.inputs do
      f.input :name
      f.input :author
      f.input :description
      f.input :price_cents
      f.input :currency
      f.input :category
      f.input :image, as: :file
    end
    f.actions
  end
end
