# frozen_string_literal: true

require "test_helper"

class PostboxsHelperTest < ActionView::TestCase
  test "投書箱フォームボタンのラベルがただしいか" do
    assert_equal postbox_submit_label(:new), "作成"
    assert_equal postbox_submit_label(:edit), "更新"
  end
end
