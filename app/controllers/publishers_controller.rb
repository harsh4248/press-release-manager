class PublishersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_publisher

  def index
    if current_user.publishers.exists?
      @publisher = current_user.publishers.first 
      @press_releases = @publisher.press_releases
    else
    
      redirect_to new_publisher_path
    
    end

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

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = current_user.publishers.build(publisher_params)
    @publisher.user_id = current_user.id

    if @publisher.save
      redirect_to publishers_path(@publisher), notice: 'Publisher was successfully created.'
    else
      render :new
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
    @press_release.publisher = @publisher
    if @press_release.save
      respond_to do |format|
        format.html { redirect_to publishers_path, notice: 'Press Release was successfully created.' }
        format.turbo_stream
      end
      # redirect_to publishers_path, notice: 'Press Release created successfully.'
    else
      render :new_press_release
    end
  end

  # def update_press_release
    
  # end

  private

  def check_if_publisher
    redirect_to root_path, alert: "Access denied." unless current_user.publisher?
  end

  def publisher_params
    params.require(:publisher).permit(:name, :description, :website_url)
  end

  def press_release_params
    params.require(:press_release).permit(:title, :content, :publish_date, :organization_id)
  end

end
