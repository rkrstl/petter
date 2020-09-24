class Tweet < ApplicationRecord
  belongs_to :user
  # has_many　:comments 
  # has_many :likes
  has_one_attached :image

  
end
