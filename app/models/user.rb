class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


has_one_attached :image
has_many :tweets
has_many :likes
has_many :comments




VALID_PASSWORD_REGEX =/\A[a-zA-Z0-9]+\z/
validates :password, presence: true, length: { minimum: 6 }, format: { with: VALID_PASSWORD_REGEX }, on: :create


validates :nickname, presence: true

validates :birth,presence:true

validates :email,presence:true,uniqueness: true,format:{with: /\A\S+@\S+\.\S+\z/}








end
