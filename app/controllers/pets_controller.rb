class PetsController < ApplicationController
   before_action :set_pet,only:[:show,:edit,:update]

 def new
   @pet = Pet.new 
 end


  def create
    @pet = Pet.create(pet_params)
    if @pet.save
    redirect_to root_path
    else
      render :new
   end
  end


  def show
  end



  def edit
  end

 def update

  if @pet.update(pet_params)
    redirect_to root_path
  else
    render 'edit'
  end
 end



  private

   def pet_params
    params.require(:pet).permit(:image,:pet_name,:bleed_id,:birth,:personality,:gender_id,:animal_type_id,:dog_bleed_id).merge(user_id:current_user.id)
   end

   def set_pet
    @pet=Pet.find(params[:id])
   end


end
