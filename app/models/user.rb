class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


def follow(other_user)
  unless self == other_user
    self.relationships.find_or_create_by(follow_id:other_user.id)
  end
end

def unfollow(other_user)
  relationship =self.relationships.find_by(follow_id: other_user.id)
  relationship.destroy if relationship
end

def following?(other_user)
  self.followings.include?(other_user)
end



has_one_attached :image
has_many :tweets
has_many :likes
has_many :comments
has_many :pets
has_many :plans

has_many :relationships
has_many :followings, through: :relationships, source: :follow
has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
has_many :followers, through: :reverse_of_relationships, source: :user




VALID_PASSWORD_REGEX =/\A[a-zA-Z0-9]+\z/
validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }, on: :create


validates :nickname, presence: true

validates :birth,presence:true

validates :email,presence:true,uniqueness: true,format:{with: /\A\S+@\S+\.\S+\z/}








end
