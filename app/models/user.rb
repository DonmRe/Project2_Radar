class User < ApplicationRecord
  has_secure_password
  has_many :comments, dependent: :destroy
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create}
  validates :alias, presence: true, uniqueness: true
end
