class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  before_validation :compute_total

  validates :quantity, numericality: { greater_than: 0 }
  validates :unit_price_cents, :total_cents, numericality: { greater_than_or_equal_to: 0 }

  def compute_total
    self.total_cents = (unit_price_cents || 0) * (quantity || 0)
  end
end
