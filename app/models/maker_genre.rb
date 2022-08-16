class MakerGenre < ApplicationRecord
  validates :mname, presence: true

  has_many :users
end
