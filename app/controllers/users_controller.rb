class UsersController < ApplicationController
  before_action :move_to_index, only:[:detail]
  before_action :set_user,only:[:show,:edit,:update,:mypage,:detail,:likes,:follower,:following]
  

    def show
      @image=@user.image
    end

    def edit 
    end

    def update
      
      if @user.update(user_params)
        redirect_to root_path
      else
        render 'edit'
      end
    end


    def mypage
    end
   
    def detail
      @pet=@user.pets.first
      @follow_count = @user.followings.count
      @follwer_count=@user.followers.count
    end

    def lists
      @pets = Pet.all
      @users=User.all
    end

    def likes
      @likes=Like.where(user_id: @user.id)
    end


    def follower
      @followers = @user.followers
    end
  
    def following
      @followings = @user.followings
    end
  
  


  private


  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end 
  
  def user_params
    params.require(:user).permit(:nickname,:email,:image,:introduction)
  end

  def set_user
    @user=User.find(params[:id])
  end
  

end
