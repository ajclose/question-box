class User < ApplicationRecord
  has_secure_password
  has_secure_token :api_token
  has_many :questions
  has_many :answers
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
