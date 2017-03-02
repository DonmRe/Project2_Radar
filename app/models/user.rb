class User < ApplicationRecord
  has_secure_password
  has_many :comments, dependent: :destroy
  validates :email, presence: true, uniqueness: true :validate_each
  validates :alias, presence: true, uniqueness: true

  def validate_each(record, attribute, value)
    record.errors.add attribute, (options[:message] || "is not an email") unless
      value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  end
end
end
