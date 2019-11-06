# frozen_string_literal: true

require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "投稿が正しくできるか" do
    visit "/postboxes/#{postboxes(:postbox_1).uid}"
    fill_in "content", with: "投稿する内容"
    click_button "匿名で投稿"
    assert_text "投稿しました"
  end
end
