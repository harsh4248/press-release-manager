class HomeController < ApplicationController

  before_action :redirect_based_on_role, if: :user_signed_in?
  def index
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
end
