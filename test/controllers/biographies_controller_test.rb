require "test_helper"

class BiographiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @biography = biographies(:one)
  end

  test "should get index" do
    get biographies_url
    assert_response :success
  end

  test "should get new" do
    get new_biography_url
    assert_response :success
  end

  test "should create biography" do
    assert_difference("Biography.count") do
      post biographies_url, params: { biography: { author_id: @biography.author_id, biography: @biography.biography, quote_id: @biography.quote_id } }
    end

    assert_redirected_to biography_url(Biography.last)
  end

  test "should show biography" do
    get biography_url(@biography)
    assert_response :success
  end

  test "should get edit" do
    get edit_biography_url(@biography)
    assert_response :success
  end

  test "should update biography" do
    patch biography_url(@biography), params: { biography: { author_id: @biography.author_id, biography: @biography.biography, quote_id: @biography.quote_id } }
    assert_redirected_to biography_url(@biography)
  end

  test "should destroy biography" do
    assert_difference("Biography.count", -1) do
      delete biography_url(@biography)
    end

    assert_redirected_to biographies_url
  end
end
