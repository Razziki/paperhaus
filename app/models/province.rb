class Province < ApplicationRecord
  has_many :users
  has_many :orders

  def total_tax_rate
    (gst || 0) + (pst || 0) + (hst || 0)
  end
end
