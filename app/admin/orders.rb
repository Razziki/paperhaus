ActiveAdmin.register Order do
  # Only allow status to be changed by admin(not implementing shipping yet)
  permit_params :status
  config.filters = true

  index do
    selectable_column
    id_column
    column :user
    column :status
    column("Total") { |o| number_to_currency(o.total_cents / 100.0) }
    column :created_at
    actions
  end

  # creating filters for active admin and ransack on the orders index page
  filter :status
  filter :user
  filter :created_at

# adding formatting instead of active admin default that match user side and adding additional rows to give complete details

show do
attributes_table do
  row :user
  row("Customer Email") { |o| o.user.email }
  row("Shipping Address") { |o| o.user.full_address }
  row :status
  row :payment_status

  row("Subtotal") { |o| number_to_currency(o.subtotal_cents / 100.0) }
  row("Tax")      { |o| number_to_currency(o.tax_cents / 100.0) }
  row("Shipping") { |o| number_to_currency(o.shipping_cents / 100.0) }
  row("Total")    { |o| number_to_currency(o.total_cents / 100.0) }

  row :currency
  row :created_at
  row :updated_at
  end

panel "Items" do
  table_for order.order_items do
    column :name
    column :quantity
    column("Unit price")  { |item| number_to_currency(item.unit_price_cents / 100.0) }
    column("Line total")  { |item| number_to_currency(item.total_cents / 100.0) }
  end

  attributes_table_for order do
    row("Subtotal") { number_to_currency(order.subtotal_cents / 100.0) }

    row("Tax#{order.province ? " (#{order.province.name})" : ""}") do
      number_to_currency(order.tax_cents / 100.0)
    end

    row("Shipping") { number_to_currency(order.shipping_cents / 100.0) }
    row("Total")    { number_to_currency(order.total_cents / 100.0) }
  end
end
  end



  # Simple edit form: Pending or Cancelled
  form do |f|
    f.inputs do
      f.input :status, as: :select,  collection: %w[pending cancelled]
    end
    f.actions
  end
end
