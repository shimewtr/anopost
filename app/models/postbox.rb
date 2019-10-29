# frozen_string_literal: true

class Postbox < ApplicationRecord
  validates :uid,  presence: true
  validates :title,  presence: true, length: { maximum: 40 }
  validates :description,  presence: true, length: { maximum: 200 }
  validates :is_published,  inclusion: { in: [true, false] }

  has_many :posts
end
