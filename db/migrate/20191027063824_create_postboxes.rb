# frozen_string_literal: true

class CreatePostboxes < ActiveRecord::Migration[6.0]
  def change
    create_table :postboxes do |t|
      t.string :uid
      t.string :title
      t.text :description
      t.boolean :is_published

      t.timestamps
    end
  end
end
