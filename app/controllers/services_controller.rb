class ServicesController < ApplicationController
  before_action :set_service, only: [ :show, :edit, :update, :destroy ]
  def index
    @service = Service.new
    @services = current_user.services.order(created_at:'desc')
  end

  def show
  end

  def new
    @service = Service.new
  end

  def edit
  end

  def create
    @service = current_user.services.new(service_params)
      if @service.save
        redirect_to service_path(@service), notice: "Service was successfully created."
      else
        redirect_to services_path,alert: "Please fill the inform"
      end
    end

  def update
      if @service.update(service_params)
        redirect_to service_path(@service), notice: "Service was successfully updated."
      else
        render 'edit'
      end
    end

  def destroy
    @service.destroy
      redirect_to services_path, notice: "Service was successfully destroyed."
    end

  private
    def set_service
      @service = current_user.services.find(params[:id])
    end

    def service_params
      params.require(:service).permit(:title, :description, :price)
    end
end
