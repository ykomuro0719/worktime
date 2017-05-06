class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected
 
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:admin, :name, :eid] )
      devise_parameter_sanitizer.permit(:account_update, keys: [:admin, :name, :eid] )
    
    end
    def authenticate_admin
      if current_user.try(:admin?)
      else
        redirect_to root_path
      end
    end

end
