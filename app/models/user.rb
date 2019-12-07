class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }

  EMAIL_REGEX = /[a-zA-Z0-9._+]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*/
  validates :email, presence: true, format: { with: EMAIL_REGEX }

  validates :password, length: { in: 8..32 }

  PW_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}\z/i
  validates :password, presence: true, format: { with: PW_REGEX }

  has_secure_password
end
