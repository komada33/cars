class PartsGenre < ApplicationRecord
  validates :pname, presence: true

  has_many :car_posts
end
