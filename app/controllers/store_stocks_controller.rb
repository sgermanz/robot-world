class StoreStocksController < ApplicationController
  before_action :set_store_stock, only: [:show, :update, :destroy]

  # GET /store_stocks
  def index
    @store_stocks = StoreStock.all

    render json: @store_stocks
  end

  # GET /store_stocks/1
  def show
    render json: @store_stock
  end

  # POST /store_stocks
  def create
    @store_stock = StoreStock.new(store_stock_params)

    if @store_stock.save
      render json: @store_stock, status: :created, location: @store_stock
    else
      render json: @store_stock.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /store_stocks/1
  def update
    if @store_stock.update(store_stock_params)
      render json: @store_stock
    else
      render json: @store_stock.errors, status: :unprocessable_entity
    end
  end

  # DELETE /store_stocks/1
  def destroy
    @store_stock.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_stock
      @store_stock = StoreStock.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def store_stock_params
      params.require(:store_stock).permit(:status)
    end
end
