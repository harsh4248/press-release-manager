class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_user
  
  def index
    @press_releases = PressRelease.all
  end
  def check_if_user
    redirect_to root_path, alert: "Access denied." unless current_user.user?
  end
end
