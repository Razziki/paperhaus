class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  validates :subtotal_cents, :tax_cents, :shipping_cents, :total_cents,
            numericality: { greater_than_or_equal_to: 0 }

  def recalc_totals
    self.subtotal_cents = order_items.sum(:total_cents)
    self.total_cents    = subtotal_cents + tax_cents + shipping_cents
    save!
  end
end
