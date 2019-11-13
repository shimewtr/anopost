# frozen_string_literal: true

require "test_helper"

class SessionsHelperTest < ActionView::TestCase
  test "log_in" do
    postbox = postboxes(:postbox_1)
    log_in(postbox)
    assert_equal session[:postbox], "jPnI0mCqv8LIPyGY9xXrIWiZadg"
  end

  test "current_postbox" do
    assert_nil current_postbox

    postbox = postboxes(:postbox_1)
    log_in(postbox)
    current = current_postbox
    assert_equal current.uid, "jPnI0mCqv8LIPyGY9xXrIWiZadg"
  end

  test "log_out" do
    postbox = postboxes(:postbox_1)
    log_in(postbox)
    assert_not_nil session[:postbox]
    assert_not_nil current_postbox

    log_out
    assert_nil session[:postbox]
    assert_nil current_postbox
  end

  test "logged_in?" do
    assert_not logged_in?

    postbox = postboxes(:postbox_1)
    log_in(postbox)
    assert logged_in?

    log_out
    assert_not logged_in?
  end

  test "admin_login?" do
    assert_not admin_login?

    postbox = postboxes(:postbox_1)
    log_in(postbox)
    @postbox = postboxes(:postbox_1)
    assert admin_login?

    @postbox = postboxes(:postbox_2)
    assert_not admin_login?

    log_out
    @postbox = postboxes(:postbox_1)
    assert_not admin_login?
  end
end
