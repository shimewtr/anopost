# frozen_string_literal: true

class Postbox < ApplicationRecord
  validates :uid,  presence: true
  validates :title,  presence: { message: "が入力が必要です。" },
            length: { maximum: 40, too_long: "#{:title}は最大#{count}文字まで入力できます。" }
  validates :description,  presence: { message: "が入力が必要です。" },
            length: { maximum: 200, too_long: "説明文は最大#{count}文字まで入力できます。" }
  validates :is_published,  inclusion: { in: [true, false] }

  has_many :posts

  def to_param
    uid
  end
end
