class StoreConfigurationsController < ApplicationController
  before_action :set_store_configuration, only: [:show, :update, :destroy]

  # GET /store_configurations
  def index
    @store_configurations = StoreConfiguration.all

    render json: @store_configurations
  end

  # GET /store_configurations/1
  def show
    render json: @store_configuration
  end

  # POST /store_configurations
  def create
    @store_configuration = StoreConfiguration.new(store_configuration_params)

    if @store_configuration.save
      render json: @store_configuration, status: :created, location: @store_configuration
    else
      render json: @store_configuration.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /store_configurations/1
  def update
    if @store_configuration.update(store_configuration_params)
      render json: @store_configuration
    else
      render json: @store_configuration.errors, status: :unprocessable_entity
    end
  end

  # DELETE /store_configurations/1
  def destroy
    @store_configuration.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_configuration
      @store_configuration = StoreConfiguration.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def store_configuration_params
      params.require(:store_configuration).permit(:configuration)
    end
end
