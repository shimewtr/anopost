# frozen_string_literal: true

class Post < ApplicationRecord
  validates :content,  presence: true, length: { maximum: 1000, too_long: "は最大1000文字まで入力できます。" }

  belongs_to :postbox
end
