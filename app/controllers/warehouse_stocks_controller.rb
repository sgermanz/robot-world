class WarehouseStocksController < ApplicationController
  before_action :set_warehouse_stock, only: [:show, :update, :destroy]

  # GET /warehouse_stocks
  def index
    @warehouse_stocks = WarehouseStock.all

    render json: @warehouse_stocks
  end

  # GET /warehouse_stocks/1
  def show
    render json: @warehouse_stock
  end

  # POST /warehouse_stocks
  def create
    @warehouse_stock = WarehouseStock.new(warehouse_stock_params)

    if @warehouse_stock.save
      render json: @warehouse_stock, status: :created, location: @warehouse_stock
    else
      render json: @warehouse_stock.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /warehouse_stocks/1
  def update
    if @warehouse_stock.update(warehouse_stock_params)
      render json: @warehouse_stock
    else
      render json: @warehouse_stock.errors, status: :unprocessable_entity
    end
  end

  # DELETE /warehouse_stocks/1
  def destroy
    @warehouse_stock.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warehouse_stock
      @warehouse_stock = WarehouseStock.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def warehouse_stock_params
      params.require(:warehouse_stock).permit(:status)
    end
end
