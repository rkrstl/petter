class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many_attached :images
  has_many :tweet_tag_relations
  has_many :tweet_tags, through: :tweet_tag_relations

  has_many :likes, dependent: :destroy
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end



  
end


