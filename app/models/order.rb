class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  belongs_to :province, optional: true

  validates :subtotal_cents, :tax_cents, :shipping_cents, :total_cents,
            numericality: { greater_than_or_equal_to: 0 }

  def recalc_totals
    self.subtotal_cents = order_items.sum(:total_cents)
    tax_rate      = province&.total_tax_rate.to_f
    self.tax_cents = (subtotal_cents * tax_rate).round
    self.total_cents    = subtotal_cents + tax_cents + shipping_cents
    save!
  end
end
