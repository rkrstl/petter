class TweetsController < ApplicationController
  def index
    @tweets=Tweet.all
  end

  def new
     @tweet=Tweet.new
  end


  def create
     @tweet=Tweet.create(tweet_params)
     if @tweet.save
      redirect_to root_path
     else
      render :new
     end
  end

  def show
    @tweet=Tweet.find(params[:id])
  end


 def lank
  @all_ranks = Tweet.find(Like.group(:tweet_id).order('count(tweet_id)desc').limit(3).pluck(:tweet_id))
 end


  private
  def tweet_params
    params.require(:tweet).permit(:title,:text,:image).merge(user_id: current_user.id)
  end


end
