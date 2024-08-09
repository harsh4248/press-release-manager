class UsersController < ApplicationController
  def index
    @press_releases = PressRelease.all
  end
end
