# frozen_string_literal: true

class RemoveIsPublishedFromPostbox < ActiveRecord::Migration[6.0]
  def change
    remove_column :postboxes, :is_published
  end
end
