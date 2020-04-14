require 'test_helper'

class WarehouseStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warehouse_stock = warehouse_stocks(:one)
  end

  test "should get index" do
    get warehouse_stocks_url, as: :json
    assert_response :success
  end

  test "should create warehouse_stock" do
    assert_difference('WarehouseStock.count') do
      post warehouse_stocks_url, params: { warehouse_stock: { status: @warehouse_stock.status } }, as: :json
    end

    assert_response 201
  end

  test "should show warehouse_stock" do
    get warehouse_stock_url(@warehouse_stock), as: :json
    assert_response :success
  end

  test "should update warehouse_stock" do
    patch warehouse_stock_url(@warehouse_stock), params: { warehouse_stock: { status: @warehouse_stock.status } }, as: :json
    assert_response 200
  end

  test "should destroy warehouse_stock" do
    assert_difference('WarehouseStock.count', -1) do
      delete warehouse_stock_url(@warehouse_stock), as: :json
    end

    assert_response 204
  end
end
