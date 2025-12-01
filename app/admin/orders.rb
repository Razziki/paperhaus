ActiveAdmin.register Order do
  # Only allow status to be changed by admin(not implementing shipping or payment status yet)
  permit_params :status

  index do
    selectable_column
    id_column
    column :user
    column :status
    column("Total") { |o| number_to_currency(o.total_cents / 100.0) }
    column :created_at
    actions
  end

  filter :status
  filter :user
  filter :created_at

  # Simple edit form: Pending or Cancelled
  form do |f|
    f.inputs do
      f.input :status, as: :select,  collection: %w[pending cancelled]
    end
    f.actions
  end
end
