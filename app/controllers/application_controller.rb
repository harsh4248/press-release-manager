class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :redirect_from_root, if: :user_signed_in?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :role])
  end 

  def redirect_from_root
    if request.path == root_path
      redirect_based_on_role
    end
  end

  def redirect_based_on_role
    case current_user.role
    when "user"
      users_path # Replace with your user index path
    when "organization"
      organizations_path # Replace with your organization index path
    when "publisher"
      publishers_path # Replace with your publisher index path
    else
      root_path # Fallback in case role is undefined
    end
  end
  def after_sign_in_path_for(resource)
    redirect_based_on_role
  end
end