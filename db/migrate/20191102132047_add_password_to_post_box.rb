# frozen_string_literal: true

class AddPasswordToPostBox < ActiveRecord::Migration[6.0]
  def change
    add_column :postboxes, :password_digest, :string, null: false
  end
end
