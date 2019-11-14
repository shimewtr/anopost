# frozen_string_literal: true

require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "page_title" do
    assert_equal "AnoPost", page_title

    @page_title = "タイトルのテスト"
    assert_equal "タイトルのテスト | AnoPost", page_title
  end

  test "show_or_edit_postbox_page?" do
    def controller_path
      "postboxes"
    end

    def action_name
      "show"
    end
    assert show_or_edit_postbox_page?

    def controller_path
      "postboxes"
    end

    def action_name
      "edit"
    end
    assert show_or_edit_postbox_page?

    def controller_path
      "postboxes"
    end

    def action_name
      "new"
    end
    assert_not show_or_edit_postbox_page?
  end
end
