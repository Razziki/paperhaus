class User < ApplicationRecord
  has_secure_password

  belongs_to :province, optional: true
  has_many   :orders, dependent: :nullify

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  # What shows up when you do user.to_s in views/admin
  def to_s
    email
  end

  def full_name
    [ first_name, last_name ].compact.join(" ")
  end

  def full_address
    [
      address_line1,
      city,
      province&.name,
      postal_code
    ].compact.join(", ")
  end
end
