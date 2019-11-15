# frozen_string_literal: true

require "test_helper"

class PostboxTest < ActiveSupport::TestCase
  test "params" do
    postbox = postboxes(:postbox_1)
    assert_equal postbox.to_param, "jPnI0mCqv8LIPyGY9xXrIWiZadg"

    postbox = postboxes(:postbox_2)
    assert_equal postbox.to_param, "Kder2aBboyt8am-LpbDaUgPwuNI"
  end
end
