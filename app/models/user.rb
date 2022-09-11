class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
  validates :car_name, presence: true, length: { maximum: 20 }
  validates :maker_genre_id, presence: true

  has_one_attached :plofile_image

  belongs_to :maker_genre
  has_many :car_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy
  has_many :good_car_posts, through: :goods, source: :car_post

  has_many :relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  def gooded_by?(car_post_id)
    goods.where(car_post_id: car_post_id).exists?
  end

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
