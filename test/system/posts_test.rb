# frozen_string_literal: true

require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  test "投稿が正しくできるか" do
    visit "/postboxes/#{postboxes(:postbox_1).uid}"
    fill_in "content", with: "投稿する内容"
    click_button "作成"
    assert_text "投稿しました"
  end

  test "公開されてる投書箱の投稿が表示されるか" do
    visit "/postboxes/#{postboxes(:published_postbox).uid}"
    fill_in "content", with: "この投稿内容は表示されます"
    click_button "作成"
    assert_text "この投稿内容は表示されます"
  end

  test "公開されない投書箱の投稿が表示されないか" do
    visit "/postboxes/#{postboxes(:unpublished_postbox).uid}"
    fill_in "content", with: "この投稿内容は表示されません"
    click_button "作成"
    assert_no_text "この投稿内容は表示されまません"
  end
end
