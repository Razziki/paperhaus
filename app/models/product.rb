class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items

  validates :name, presence: true
  validates :price_cents, numericality: { greater_than_or_equal_to: 0 }

  def self.ransackable_attributes(auth_object = nil)
    %w[
      id
      name
      author
      description
      price_cents
      currency
      category_id
      created_at
      updated_at
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[category]
  end
end
