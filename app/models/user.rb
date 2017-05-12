class User < ApplicationRecord
  validates :username, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

end
