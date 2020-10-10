class TagsForm

  include ActiveModel::Model
  attr_accessor :user_id,:title,:text,:name,:images

  with_options presence: true do
    validates :images
    validates  :title
    validates :text
    validates :name
  end

  def save
    tweet = Tweet.create(title:title, user_id:user_id,text:text,images:images)
    tweet_tag = TweetTag.where(name: name).first_or_initialize
    tweet_tag.save

    TweetTagRelation.create(tweet_id: tweet.id, tweet_tag_id: tweet_tag.id)
  end

end