require "application_system_test_case"

class BiographiesTest < ApplicationSystemTestCase
  setup do
    @biography = biographies(:one)
  end

  test "visiting the index" do
    visit biographies_url
    assert_selector "h1", text: "Biographies"
  end

  test "should create biography" do
    visit biographies_url
    click_on "New biography"

    fill_in "Author", with: @biography.author_id
    fill_in "Biography", with: @biography.biography
    fill_in "Quote", with: @biography.quote_id
    click_on "Create Biography"

    assert_text "Biography was successfully created"
    click_on "Back"
  end

  test "should update Biography" do
    visit biography_url(@biography)
    click_on "Edit this biography", match: :first

    fill_in "Author", with: @biography.author_id
    fill_in "Biography", with: @biography.biography
    fill_in "Quote", with: @biography.quote_id
    click_on "Update Biography"

    assert_text "Biography was successfully updated"
    click_on "Back"
  end

  test "should destroy Biography" do
    visit biography_url(@biography)
    click_on "Destroy this biography", match: :first

    assert_text "Biography was successfully destroyed"
  end
end
