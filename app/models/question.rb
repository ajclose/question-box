class Question < ApplicationRecord
  include PgSearch
  belongs_to :user
  has_many :answers, dependent: :destroy
  validates :title, presence: true
  validates :body, presence: true

  pg_search_scope :search_title_and_body, against: [:title, :body], using: {tsearch: {prefix: true}}
end
