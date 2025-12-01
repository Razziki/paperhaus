class Order < ApplicationRecord
  belongs_to :user
  has_many   :order_items, dependent: :destroy
  belongs_to :province, optional: true

  validates :subtotal_cents, :tax_cents, :shipping_cents, :total_cents,
            numericality: { greater_than_or_equal_to: 0 }

  def recalc_totals!
    self.subtotal_cents = order_items.to_a.sum { |item| item.total_cents }
    tax_rate = province&.total_tax_rate.to_f
    self.tax_cents = (subtotal_cents * tax_rate).round
    self.shipping_cents ||= 0
    self.total_cents = subtotal_cents + tax_cents + shipping_cents
  end

    def self.ransackable_attributes(auth_object = nil)
    %w[id user_id province_id status payment_status subtotal_cents tax_cents shipping_cents total_cents currency
      placed_at
      created_at
      updated_at
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[user province order_items]
  end
end
