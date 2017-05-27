class User < ApplicationRecord
  has_many :texts

  #use the bcrypt gem for secure password
  has_secure_password
  before_save { self.email = email.downcase }


  validates :username, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: VALID_EMAIL_REGEX },
                  uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }

# email uniqueness
end
