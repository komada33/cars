class CarPost < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :message, presence: true
  validates :parts_genre_id, presence: true
  validates :car_images, presence: true

  belongs_to :parts_genre
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :good_users, through: :goods, source: :user
  has_many_attached :car_images

end
