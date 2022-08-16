class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :car_post
end
