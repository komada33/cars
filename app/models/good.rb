class Good < ApplicationRecord
  belongs_to :user
  belongs_to :car_post

  validates_uniqueness_of :car_post_id, scope: :user_id
end
