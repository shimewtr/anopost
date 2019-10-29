# frozen_string_literal: true

require "test_helper"

class PostTest < ActiveSupport::TestCase
  setup do
    @post = posts(:post_1)
  end

  test "contentのバリデーションが正しいか" do
    post = posts(:post_1)
    post.content = "a"
    assert post.valid?
    post.content = "abc123!_-=あア亜"
    assert post.valid?
    post.content = "a" * 200
    assert post.valid?
    post.content = "あ" * 201
    assert post.invalid?
  end
end
