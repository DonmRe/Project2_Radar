class Post < ApplicationRecord
  belongs_to :topic
  belongs_to :location
  has_many :comments
end
