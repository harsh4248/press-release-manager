class OrganizationsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_organization
  def index
    if current_user.organizations.exists?
      @organization = current_user.organizations.first
      # @publishers = @organization.publishers
      # @press_releases = @organization.press_releases
    else
      redirect_to new_organization_path
    end
  end
  def new
    @organization = Organization.new
  end

  def create
    @organization = current_user.organizations.build(organization_params)
    @organization.user_id = current_user.id
    if @organization.save
      redirect_to organizations_url, notice: "Organization created successfully."
    else
      render :new
    end
  end

  def edit
    @organization = current_user.organizations.find(params[:id])
  end

  def update
    @organization = current_user.organizations.find(params[:id])
    if @organization.update(organization_params)
      redirect_to organizations_path, notice: 'Organization updated successfully.'
    else
      render :edit
    end
  end

  private

  def check_if_organization
    redirect_to root_path, alert: "Access denied." unless current_user.organization?
  end

  def organization_params
    params.require(:organization).permit(:name, :description, :contact_email, :phone_number)
  end
end
