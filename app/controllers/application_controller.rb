class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_up_path_for(resource)
    user_path(current_user)
  end
  
  def autheniticate_user
    if current_user == nil
      redirect_to new_user_session_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :user_name])
  end

end
