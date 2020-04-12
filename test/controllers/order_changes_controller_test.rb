require 'test_helper'

class OrderChangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_change = order_changes(:one)
  end

  test "should get index" do
    get order_changes_url, as: :json
    assert_response :success
  end

  test "should create order_change" do
    assert_difference('OrderChange.count') do
      post order_changes_url, params: { order_change: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show order_change" do
    get order_change_url(@order_change), as: :json
    assert_response :success
  end

  test "should update order_change" do
    patch order_change_url(@order_change), params: { order_change: {  } }, as: :json
    assert_response 200
  end

  test "should destroy order_change" do
    assert_difference('OrderChange.count', -1) do
      delete order_change_url(@order_change), as: :json
    end

    assert_response 204
  end
end
