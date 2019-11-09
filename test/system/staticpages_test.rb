# frozen_string_literal: true

require "application_system_test_case"

class StaticPagesTest < ApplicationSystemTestCase
  test "このサイトについてページが正しく表示されるか" do
    visit static_pages_about_path
    assert_text "このサイトについて"
  end

  test "免責事項ページが正しく表示されるか" do
    visit static_pages_discramer_path
    assert_text "免責事項"
  end

  test "Cookieポリシーページが正しく表示されるか" do
    visit static_pages_about_path
    assert_text "Cookieポリシー"
  end
end
