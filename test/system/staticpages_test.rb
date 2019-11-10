# frozen_string_literal: true

require "application_system_test_case"

class StaticPagesTest < ApplicationSystemTestCase
  test "AnoPostとはページが正しく表示されるか" do
    visit static_pages_about_path
    assert_selector ".static-pages__title", text: "AnoPostとは"
  end

  test "免責事項ページが正しく表示されるか" do
    visit static_pages_discramer_path
    assert_selector ".static-pages__title", text: "免責事項"
  end

  test "Cookieポリシーページが正しく表示されるか" do
    visit static_pages_privacy_path
    assert_selector ".static-pages__title", text: "Cookieポリシー"
  end
end
