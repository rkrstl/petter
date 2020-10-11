class UsersController < ApplicationController
  before_action :move_to_index, only:[:detail]
  

  def show
    @user=User.find(params[:id])
    @image=@user.image
  end

  def edit 
     @user=User.find(params[:id])
  end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to root_path
      else
        render 'edit'
      end
    end


    def mypage
      @user = User.find(params[:id])
    end
   
    def detail
      
      @user = User.find(params[:id])
      @pet=@user.pets.first
      @follow_count = @user.followings.count
      @follwer_count=@user.followers.count
    end

    def lists

      @pets = Pet.all
      @users=User.all
    end

    def likes
      
      @user=User.find_by(id:params[:id])
      @likes=Like.where(user_id: @user.id)
    end


    def follower
    
      @user = User.find(params[:id])
      @pets=@user.pets
      @followers = @user.followers
      
    end
  
    def following
      
      @user = User.find(params[:id])
      @pets=@user.pets
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
  

end
