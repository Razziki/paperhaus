class Province < ApplicationRecord
  has_many :users

  def total_tax_rate
    (gst || 0) + (pst || 0) + (hst || 0)
  end
end
