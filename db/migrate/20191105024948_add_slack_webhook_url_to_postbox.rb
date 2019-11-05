# frozen_string_literal: true

class AddSlackWebhookUrlToPostbox < ActiveRecord::Migration[6.0]
  def change
    add_column :postboxes, :slack_webhook_url, :string, null: true
  end
end
