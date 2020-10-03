class PetsController < ApplicationController

 def new
   @pet = Pet.new 
 end


  def create
    @pet = Pet.create(pet_params)
    if @tweet.save
    redirect_to root_path
    else
      render :new
   end
  end


  private

   def pet_params
    params.require(:pet).permit(:pet_name,:bleed_id,:birth,:age,:personality).merge(user_id:current_user.id)
   end


end
