class TweetsController < ApplicationController
  before_action :move_to_index,except:[:index,:show, :search]

  def index
    @tweets=Tweet.all
    @pets =Pet.all
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
    @comments = @tweet.comments.includes(:user)
    @comment=Comment.new 
    

  end


 def lank
   @all_ranks = Tweet.find(Like.group(:tweet_id).order('count(tweet_id)desc').limit(3).pluck(:tweet_id))
 end


  private

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end 


  def tweet_params
    params.require(:tweet).permit(:title,:text,:image).merge(user_id: current_user.id)
  end


   

end
