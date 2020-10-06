class PetsController < ApplicationController

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
    @pet=Pet.find(params[:id])
    
  end

  def edit
    @pet = Pet.find(params[:id])
  end

 def update
  @pet = Pet.find(params[:id])
  if @pet.update(pet_params)
    redirect_to root_path
  else
    render 'edit'
  end
 end

  private

   def pet_params
    params.require(:pet).permit(:image,:pet_name,:bleed_id,:birth,:personality,:gender_id,:animal_type).merge(user_id:current_user.id)
   end


end
