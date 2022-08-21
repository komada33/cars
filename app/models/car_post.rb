class CarPost < ApplicationRecord
  validates :title, presence: true, length: { maximum: 30 }
  validates :message, presence: true, length: { maximum: 900 }
  validates :parts_genre_id, presence: true
  validates :car_images, presence: true

  mount_uploaders :car_images, CarImageUploader
  belongs_to :parts_genre
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many_attached :car_images, dependent: :destroy

  def gooded?(user)
    goods.where(user_id: user.id).exists?
  end
end
