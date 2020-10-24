class AnimalTypesController < ApplicationController

  def show
    @animal_type = AnimalType.find_by(id: params[:id])
    @pets = Pet.where(animal_type_id: params[:id])
  end

end
