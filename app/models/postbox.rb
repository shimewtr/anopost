# frozen_string_literal: true

class Postbox < ApplicationRecord
  has_secure_password validations: false
  validates :password,
            length: { minimum: 6, too_short: "は6文字以上40文字以下で入力してください。",
                      maximum: 40, too_long: "は6文字以上40文字以下で入力してください。" },
            confirmation: true, on: :create

  validates :uid,  presence: true
  validates :title,  presence: { message: "を入力してください。" },
            length: { maximum: 100, too_long: "は最大40文字まで入力できます。" }
  validates :description,  presence: { message: "を入力してください。" },
            length: { maximum: 200, too_long: "は最大200文字まで入力できます。" }
  validates :is_published,  inclusion: { in: [true, false] }
  validates :slack_webhook_url,
            format: {
                      allow_blank: true,
                      with: /\Ahttps:\/\/hooks\.slack\.com\/services\/.*/,
                      message: "の形式が正しくありません。"
                    }

  has_many :posts

  def to_param
    uid
  end
end
