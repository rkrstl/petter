class TagsForm

  include ActiveModel::Model
  attr_accessor :user_id,:title,:text,:image ,:name

  with_options presence: true do
    validates :image
    validates  :title
    validates :text
    validates :name
  end

  def save
    tweet = Tweet.create(title:title, user_id:user_id,text:text,image:image)
    tweet_tag = TweetTag.where(name: name).first_or_initialize
    tweet_tag.save

    TweetTagRelation.create(tweet_id: tweet.id, tweet_tag_id: tweet_tag.id)
  end

end