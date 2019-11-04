# frozen_string_literal: true

require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  setup do
    @postbox = postboxes(:postbox_1)
  end

  test "管理者ログインへのリンクが正しく表示されるか" do
    visit root_path
    assert_no_selector ".admin-link-box"
    visit postbox_path(@postbox)
    assert_selector ".admin-link-box"
  end

  test "管理者ログインが正しくできるか" do
    visit postbox_path(@postbox)
    find(".admin-link__text").click
    fill_in "password", with: "123456"
    click_button "login"
    assert_text "管理者としてログインしました。"
  end
end
