class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :password, length: { in: 8..12 }
  validates :name, length: { in: 1..15 }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
 validates :password, /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i
  has_secure_password
end
