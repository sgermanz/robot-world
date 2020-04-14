class OrderChangesController < ApplicationController
  before_action :set_order_change, only: [:show, :update, :destroy]

  # GET /order_changes
  def index
    @order_changes = OrderChange.all

    render json: @order_changes
  end

  # GET /order_changes/1
  def show
    render json: @order_change
  end

  # POST /order_changes
  def create
    @order_change = OrderChange.new(order_change_params)

    if @order_change.save
      render json: @order_change, status: :created, location: @order_change
    else
      render json: @order_change.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_changes/1
  def update
    if @order_change.update(order_change_params)
      render json: @order_change
    else
      render json: @order_change.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_changes/1
  def destroy
    @order_change.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_change
      @order_change = OrderChange.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_change_params
      params.fetch(:order_change, {})
    end
end
