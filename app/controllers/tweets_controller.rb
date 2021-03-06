class TweetsController < ApplicationController
  before_action :move_to_index,except:[:index ,:search,:lank,:new_guest]
  before_action :set_tweet,only:[:show,:edit,:update]


  def index
    plan
    @tweets=Tweet.all.order("tweets.created_at DESC")
    @pets =Pet.all
    @animal_types = AnimalType.all
  end

  def new
     @tweet=TagsForm.new
  end


  def create
     @tweet=TagsForm.new(tweet_params)
     if @tweet.valid?
        @tweet.save
      redirect_to root_path
     else
      render :new
     end
  end


  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to plans_path
     else
     render :edit
    end
  end

  def destroy
    tweet=Tweet.find(params[:id])
    if tweet.destroy
       redirect_to root_path
    else
      render :show
    end
 end

  def show
    @tweets=Tweet.all
    @comments = @tweet.comments.includes(:user)
    @comment=Comment.new 
  end


 def lank
   @all_ranks = Tweet.find(Like.group(:tweet_id).order('count(tweet_id)desc').limit(3).pluck(:tweet_id))
   @tag_lanks = TweetTag.find( TweetTagRelation.group(:tweet_tag_id).order('count(tweet_tag_id)desc').limit(4).pluck(:tweet_tag_id))
 end


 def new_guest
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    user.nickname = "ゲスト"
    user.birth= "1997-07-14"   
  end
  sign_in user
  redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
end


def search
  return nil if params[:keyword] == ""
  tweet_tag = TweetTag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
  render json:{ keyword: tweet_tag }
end



private
    
  def plan
    if user_signed_in?
    @plans = current_user.plans
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end 


  def tweet_params
    params.require(:tags_form).permit(:title,:text,:name,images:[]).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet=Tweet.find(params[:id])
  end

end
