# frozen_string_literal: true

require "application_system_test_case"

class StaticPagesTest < ApplicationSystemTestCase
  test "このサイトについてページが正しく表示されるか" do
    visit static_pages_about_path
    assert_text "このサイトについて"
  end

  test "利用規約ページが正しく表示されるか" do
    visit static_pages_tos_path
    assert_text "利用規約"
  end

  test "プライバシーポリシーページが正しく表示されるか" do
    visit static_pages_about_path
    assert_text "プライバシーポリシー"
  end
end
