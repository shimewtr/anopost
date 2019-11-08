# frozen_string_literal: true

require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "正しいページタイトルを返すか" do
    assert_equal "AnoPost", page_title

    @page_title = "タイトルのテスト"
    assert_equal "タイトルのテスト | AnoPost", page_title
  end

  test "投書箱のshowページ、editページの判定が正しいか" do
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
