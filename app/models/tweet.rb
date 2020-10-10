class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments,dependent: :destroy
  has_many_attached :images,dependent: :destroy
  has_many :tweet_tag_relations,dependent: :destroy
  has_many :tweet_tags, through: :tweet_tag_relations,dependent: :destroy

  has_many :likes, dependent: :destroy
  def like_user(user_id)
   likes.find_by(user_id: user_id)
  end



  
end


