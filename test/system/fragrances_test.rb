require "application_system_test_case"

class FragrancesTest < ApplicationSystemTestCase
  setup do
    @fragrance = fragrances(:one)
  end

  test "visiting the index" do
    visit fragrances_url
    assert_selector "h1", text: "Fragrances"
  end

  test "should create fragrance" do
    visit fragrances_url
    click_on "New fragrance"

    fill_in "Name", with: @fragrance.name
    fill_in "X", with: @fragrance.x
    fill_in "Y", with: @fragrance.y
    click_on "Create Fragrance"

    assert_text "Fragrance was successfully created"
    click_on "Back"
  end

  test "should update Fragrance" do
    visit fragrance_url(@fragrance)
    click_on "Edit this fragrance", match: :first

    fill_in "Name", with: @fragrance.name
    fill_in "X", with: @fragrance.x
    fill_in "Y", with: @fragrance.y
    click_on "Update Fragrance"

    assert_text "Fragrance was successfully updated"
    click_on "Back"
  end

  test "should destroy Fragrance" do
    visit fragrance_url(@fragrance)
    click_on "Destroy this fragrance", match: :first

    assert_text "Fragrance was successfully destroyed"
  end
end
