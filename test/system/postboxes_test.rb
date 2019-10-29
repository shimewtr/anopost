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
    click_button "作成"
    assert_text "投書箱のタイトルを作成しました"
  end
end
