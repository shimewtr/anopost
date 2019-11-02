# frozen_string_literal: true

class Postbox < ApplicationRecord
  has_secure_password

  validates :password,
            length: { minimum: 6, too_short: "は6文字以上入力してください。",
                      maximum: 40, too_long: "は最大40文字まで入力できます。" },
            on: :new

  validates :uid,  presence: true
  validates :title,  presence: { message: "が入力が必要です。" },
            length: { maximum: 40, too_long: "#{:title}は最大40文字まで入力できます。" }
  validates :description,  presence: { message: "が入力が必要です。" },
            length: { maximum: 200, too_long: "説明文は最大200文字まで入力できます。" }
  validates :is_published,  inclusion: { in: [true, false] }

  has_many :posts

  def to_param
    uid
  end
end
