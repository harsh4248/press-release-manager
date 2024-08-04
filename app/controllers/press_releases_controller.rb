class PressReleasesController < ApplicationController
  before_action :set_press_release, only: [:show, :edit, :update, :destroy]

  def index
    @press_releases = PressRelease.all
  end

  def show
  end

  def new
    @press_release = PressRelease.new
  end

  def create
    @press_release = PressRelease.new(press_release_params)
    if @press_release.save
      redirect_to @press_release, notice: 'Press release was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @press_release.update(press_release_params)
      redirect_to @press_release, notice: 'Press release was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @press_release.destroy
    redirect_to press_releases_url, notice: 'Press release was successfully destroyed.'
  end

  private

  def set_press_release
    @press_release = PressRelease.find(params[:id])
  end

  def press_release_params
    params.require(:press_release).permit(:title, :content, :publish_date, :publisher_id, :user_id)
  end
end
