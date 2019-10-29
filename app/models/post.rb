# frozen_string_literal: true

class Post < ApplicationRecord
  validates :content,  presence: true, length: { maximum: 200 }

  belongs_to :postbox
end
