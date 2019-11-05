# frozen_string_literal: true

require "application_system_test_case"

class PostboxesTest < ApplicationSystemTestCase
  test "投書箱作成ページが正しく表示されるか" do
    visit root_path
    assert_equal "AnoPost", title
  end

  test "投書箱が正しく作成できるか" do
    visit root_path
    fill_in "postbox_title", with: "投書箱のタイトル"
    fill_in "postbox_description", with: "投書箱の説明テキスト"
    fill_in "postbox_password", with: "123456"
    fill_in "postbox_password_confirmation", with: "123456"
    click_button "作成"
    assert_text "投書箱のタイトルを作成しました"
  end

  test "投書箱が正しく更新できるか" do
    visit postbox_path(postboxes(:postbox_1))
    find(".admin-link__text").click
    fill_in "password", with: "123456"
    click_button "login"
    assert_text "管理者としてログインしました。"

    visit edit_postbox_path(postboxes(:postbox_1))
    find(".edit-tab__item-form").click
    fill_in "postbox_title", with: "更新後のタイトル"
    fill_in "postbox_description", with: "更新後の説明テキスト"
    fill_in "postbox_slack_webhook_url", with: "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
    click_button "更新"
    assert_text "更新後のタイトルを更新しました"
  end
end
