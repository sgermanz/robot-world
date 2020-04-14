require 'test_helper'

class StoreConfigurationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_configuration = store_configurations(:one)
  end

  test "should get index" do
    get store_configurations_url, as: :json
    assert_response :success
  end

  test "should create store_configuration" do
    assert_difference('StoreConfiguration.count') do
      post store_configurations_url, params: { store_configuration: { configuration: @store_configuration.configuration } }, as: :json
    end

    assert_response 201
  end

  test "should show store_configuration" do
    get store_configuration_url(@store_configuration), as: :json
    assert_response :success
  end

  test "should update store_configuration" do
    patch store_configuration_url(@store_configuration), params: { store_configuration: { configuration: @store_configuration.configuration } }, as: :json
    assert_response 200
  end

  test "should destroy store_configuration" do
    assert_difference('StoreConfiguration.count', -1) do
      delete store_configuration_url(@store_configuration), as: :json
    end

    assert_response 204
  end
end
