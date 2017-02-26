class Post < ApplicationRecord
  belongs_to :topic
  accepts_nested_attributes_for :topic

  belongs_to :location
  accepts_nested_attributes_for :location

  has_many :comments
  accepts_nested_attributes_for :comments
end
