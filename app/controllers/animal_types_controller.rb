class AnimalTypesController < ApplicationController

  def show
    
    @pets = Pet.where(animal_type_id: params[:id])
  end

end
