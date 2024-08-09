class PublishersController < ApplicationController
  def index
    @publisher = current_user.publishers.first 
    @press_releases = @publisher.press_releases
  end
  def edit
    @publisher = current_user.publishers.find(params[:id])
  end

  def update
    @publisher = current_user.publishers.find(params[:id])
    if @publisher.update(publisher_params)
      redirect_to publishers_path, notice: 'Publisher updated successfully.'
    else
      render :edit
    end
  end

  def new_press_release
    @publisher = current_user.publishers.find(params[:id])
    @press_release = @publisher.press_releases.build
  end

  def create_press_release
    @publisher = current_user.publishers.find(params[:id])
    @press_release = @publisher.press_releases.build(press_release_params)
    @press_release.user = current_user
    if @press_release.save
      redirect_to publishers_path, notice: 'Press Release created successfully.'
    else
      render :new_press_release
    end
  end

  private

  def publisher_params
    params.require(:publisher).permit(:name, :description, :website_url)
  end

  def press_release_params
    params.require(:press_release).permit(:title, :content, :publish_date)
  end
end
