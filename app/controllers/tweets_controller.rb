class TweetsController < ApplicationController
  before_action :move_to_index,except:[:index,:show, :search]

  def index
    @tweets=Tweet.all
    @pets =Pet.all
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

  def show
    @tweet=Tweet.find(params[:id])
    @comments = @tweet.comments.includes(:user)
    @comment=Comment.new 
  end


 def lank
   @all_ranks = Tweet.find(Like.group(:tweet_id).order('count(tweet_id)desc').limit(3).pluck(:tweet_id))
   @tag_lanks = TweetTag.find( TweetTagRelation.group(:tweet_tag_id).order('count(tweet_tag_id)desc').limit(4).pluck(:tweet_tag_id))
 end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end 


  def tweet_params
    params.require(:tags_form).permit(:title,:text,:image,:name).merge(user_id: current_user.id)
  end
end
