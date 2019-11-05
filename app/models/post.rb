# frozen_string_literal: true

class Post < ApplicationRecord
  validates :content,  presence: true, length: { maximum: 200, too_long: "は最大200文字まで入力できます。" }

  belongs_to :postbox
end
