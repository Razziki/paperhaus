class User < ApplicationRecord
  has_secure_password
  belongs_to :province, optional: true
  has_many :orders, dependent: :nullify

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
