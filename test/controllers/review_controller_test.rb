require 'test_helper'

class ReviewControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get review_index_url
    assert_response :success
  end

  test "should get new" do
    get review_new_url
    assert_response :success
  end

end
