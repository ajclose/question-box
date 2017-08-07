class Question < ApplicationRecord
  include PgSearch
  belongs_to :user
  has_many :answers, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true

  pg_search_scope :search_by_body, against: :body, using: {tsearch: {prefix: true}}
end
