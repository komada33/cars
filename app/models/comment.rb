class Comment < ApplicationRecord
  validates :post_comment, presence: true, length: { maximum: 495 }

  belongs_to :user
  belongs_to :car_post

  validates :post_comment, presence: true
end
