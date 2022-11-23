require "test_helper"

class PocosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @poco = pocos(:one)
  end

  test "should get index" do
    get pocos_url
    assert_response :success
  end

  test "should get new" do
    get new_poco_url
    assert_response :success
  end

  test "should create poco" do
    assert_difference("Poco.count") do
      post pocos_url, params: { poco: { cidade: @poco.cidade, complemento: @poco.complemento, endereco: @poco.endereco, estado: @poco.estado, lat: @poco.lat, long: @poco.long, res: @poco.res, telefone: @poco.telefone } }
    end

    assert_redirected_to poco_url(Poco.last)
  end

  test "should show poco" do
    get poco_url(@poco)
    assert_response :success
  end

  test "should get edit" do
    get edit_poco_url(@poco)
    assert_response :success
  end

  test "should update poco" do
    patch poco_url(@poco), params: { poco: { cidade: @poco.cidade, complemento: @poco.complemento, endereco: @poco.endereco, estado: @poco.estado, lat: @poco.lat, long: @poco.long, res: @poco.res, telefone: @poco.telefone } }
    assert_redirected_to poco_url(@poco)
  end

  test "should destroy poco" do
    assert_difference("Poco.count", -1) do
      delete poco_url(@poco)
    end

    assert_redirected_to pocos_url
  end
end
