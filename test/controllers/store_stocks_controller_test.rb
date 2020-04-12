require 'test_helper'

class StoreStocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_stock = store_stocks(:one)
  end

  test "should get index" do
    get store_stocks_url, as: :json
    assert_response :success
  end

  test "should create store_stock" do
    assert_difference('StoreStock.count') do
      post store_stocks_url, params: { store_stock: { status: @store_stock.status } }, as: :json
    end

    assert_response 201
  end

  test "should show store_stock" do
    get store_stock_url(@store_stock), as: :json
    assert_response :success
  end

  test "should update store_stock" do
    patch store_stock_url(@store_stock), params: { store_stock: { status: @store_stock.status } }, as: :json
    assert_response 200
  end

  test "should destroy store_stock" do
    assert_difference('StoreStock.count', -1) do
      delete store_stock_url(@store_stock), as: :json
    end

    assert_response 204
  end
end
