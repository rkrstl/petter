class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?


    def search
      
      @search= Pet.ransack(params[:q])
      @pets=@search.result
      
    end


    


    private

  
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:birth,:introduction,:bleed_id,:pet_name,:image])
  end
  
end







