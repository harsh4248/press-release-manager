class PressReleasesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_publisher
  # before_action :set_publisher
  # before_action :set_press_release, only: [:edit, :update, :destroy]
  
  

  def new
    @publisher = current_user.publishers.first
    @press_release = @publisher.press_releases.build
  end

  def create
    @publisher = current_user.publishers.first
    @press_release = @publisher.press_releases.build(press_release_params)
    @press_release.user = current_user
    @press_release.publisher = @publisher
    puts params.inspect
    if @press_release.save
      # redirect_to publisher_press_releases_path(@publisher), notice: 'Press release was successfully created.'
      # @press_release = @publisher.press_releases.find(params[:publisher_id])
      respond_to do |format|
        format.html { redirect_to publishers_path, notice: 'Press Release was successfully created.' }
        format.turbo_stream
      end
    else
      render :new
    end
  end

  def edit
    @publisher = current_user.publishers.first
    @press_release = @publisher.press_releases.find(params[:id])
  end

  def update
    @publisher = current_user.publishers.first
    @press_release = @publisher.press_releases.find(params[:id])
    if @press_release.update(press_release_params)
      # redirect_to publisher_press_releases_path(@publisher), notice: 'Press release was successfully updated.'
      respond_to do |format|
        format.html { redirect_to publishers_path, notice: 'Press Release was successfully updated.' }
        format.turbo_stream
      end
    else
      render :edit
    end
  end

  def destroy
    @publisher = current_user.publishers.first
    @press_release = @publisher.press_releases.find(params[:id])
    @press_release.destroy
    # redirect_to publishers_path, notice: 'Press release was successfully deleted.'
    respond_to do |val|
      val.html { redirect_to publishers_path, notice: 'Press Release was successfully deleted.' }
      val.turbo_stream
      val.any { head :no_content } 
    end
  end

  private

  def check_if_publisher
    redirect_to root_path, alert: "Access denied." unless current_user.publisher?
  end

  # def set_publisher
  #   @publisher = current_user.publishers.first
  # end

  def set_press_release
    @press_release = @publisher.press_releases.find(params[:id])
  end

  def press_release_params
    params.require(:press_release).permit(:title, :content, :publish_date, :organization_id)
  end
end
