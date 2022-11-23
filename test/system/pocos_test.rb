require "application_system_test_case"

class PocosTest < ApplicationSystemTestCase
  setup do
    @poco = pocos(:one)
  end

  test "visiting the index" do
    visit pocos_url
    assert_selector "h1", text: "Pocos"
  end

  test "should create poco" do
    visit pocos_url
    click_on "New poco"

    fill_in "Cidade", with: @poco.cidade
    fill_in "Complemento", with: @poco.complemento
    fill_in "Endereco", with: @poco.endereco
    fill_in "Estado", with: @poco.estado
    fill_in "Lat", with: @poco.lat
    fill_in "Long", with: @poco.long
    check "Res" if @poco.res
    fill_in "Telefone", with: @poco.telefone
    click_on "Create Poco"

    assert_text "Poco was successfully created"
    click_on "Back"
  end

  test "should update Poco" do
    visit poco_url(@poco)
    click_on "Edit this poco", match: :first

    fill_in "Cidade", with: @poco.cidade
    fill_in "Complemento", with: @poco.complemento
    fill_in "Endereco", with: @poco.endereco
    fill_in "Estado", with: @poco.estado
    fill_in "Lat", with: @poco.lat
    fill_in "Long", with: @poco.long
    check "Res" if @poco.res
    fill_in "Telefone", with: @poco.telefone
    click_on "Update Poco"

    assert_text "Poco was successfully updated"
    click_on "Back"
  end

  test "should destroy Poco" do
    visit poco_url(@poco)
    click_on "Destroy this poco", match: :first

    assert_text "Poco was successfully destroyed"
  end
end
