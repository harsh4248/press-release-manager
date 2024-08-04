class PublishersController < ApplicationController
  before_action :set_publisher, only: [:show, :edit, :update, :destroy]

  def index
    @publishers = Publisher.all
  end

  def show
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      redirect_to @publisher, notice: 'Publisher was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @publisher.update(publisher_params)
      redirect_to @publisher, notice: 'Publisher was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @publisher.destroy
    redirect_to publishers_url, notice: 'Publisher was successfully destroyed.'
  end

  private

  def set_publisher
    @publisher = Publisher.find(params[:id])
  end

  def publisher_params
    params.require(:publisher).permit(:name, :description, :website_url)
  end
end
