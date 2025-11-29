class Province < ApplicationRecord
  has_many :users
  has_many :orders

  validates :name, presence: true, uniqueness: true
  validates :gst, :pst, :hst, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  def total_tax_rate
    (gst || 0) + (pst || 0) + (hst || 0)
  end
end
