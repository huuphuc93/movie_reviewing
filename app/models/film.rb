class Film < ApplicationRecord
  has_many :post_reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :categorys, dependent: :destroy
  has_many :watching_time, dependent: :destroy
  validates :name, presence: true
  validates :play_time, presence: true
  default_scope -> { order(created_at: :desc) }
  validates :describe, presence: true, length: { maximum: 450 }
end
