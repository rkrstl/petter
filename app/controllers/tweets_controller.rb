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
    @user=
    @tweet=Tweet.find(params[:id])
  end

private
def tweet_params
  params.require(:tweet).permit(:title,:text,:image).merge(user_id: current_user.id)
end


end