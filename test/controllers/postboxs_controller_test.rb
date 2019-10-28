# frozen_string_literal: true

require "test_helper"

class PostboxsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get postboxs_index_url
    assert_response :success
  end

  test "should get show" do
    get postboxs_show_url
    assert_response :success
  end

  test "should get new" do
    get postboxs_new_url
    assert_response :success
  end

  test "should get edit" do
    get postboxs_edit_url
    assert_response :success
  end
end
