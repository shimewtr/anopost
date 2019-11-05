# frozen_string_literal: true

require "test_helper"

class PostboxTest < ActiveSupport::TestCase
  setup do
    @postbox = postboxes(:postbox_1)
    @postbox.password = "123456"
    @password_confirmation = "123456"
  end

  test "titleのバリデーションが正しいか" do
    @postbox.title = "ポストボックスのタイトル"
    assert @postbox.valid?
    @postbox.title = "abc123!_-=あア亜"
    assert @postbox.valid?
    @postbox.title = "あ" * 100
    assert @postbox.valid?
    @postbox.title = "あ" * 101
    assert @postbox.invalid?
  end

  test "descriptionのバリデーションが正しいか" do
    @postbox.description = "ポストボックスの説明テキスト"
    assert @postbox.valid?
    @postbox.description = "abc123!_-=あア亜"
    assert @postbox.valid?
    @postbox.description = "あ" * 200
    assert @postbox.valid?
    @postbox.description = "あ" * 201
    assert @postbox.invalid?
  end

  test "slack_webhook_urlのバリデーションが正しいか" do
    @postbox.slack_webhook_url = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
    assert @postbox.valid?
    @postbox.slack_webhook_url = "https://api.slack.com/messaging/webhooks#"
    assert @postbox.invalid?
  end
end
