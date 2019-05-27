require 'test_helper'

class ShrinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shrink = shrinks(:one)
  end

  test "should get index" do
    get shrinks_url
    assert_response :success
  end

  test "should get new" do
    get new_shrink_url
    assert_response :success
  end

  test "should create shrink" do
    assert_difference('Shrink.count') do
      post shrinks_url, params: { shrink: {  } }
    end

    assert_redirected_to shrink_url(Shrink.last)
  end

  test "should show shrink" do
    get shrink_url(@shrink)
    assert_response :success
  end

  test "should get edit" do
    get edit_shrink_url(@shrink)
    assert_response :success
  end

  test "should update shrink" do
    patch shrink_url(@shrink), params: { shrink: {  } }
    assert_redirected_to shrink_url(@shrink)
  end

  test "should destroy shrink" do
    assert_difference('Shrink.count', -1) do
      delete shrink_url(@shrink)
    end

    assert_redirected_to shrinks_url
  end
end
