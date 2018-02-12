class User < ApplicationRecord
  has_secure_password
  validates :password_digest, presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A\S+@.+\.\S+\z/, message: 'Must be email address.' },
            length: { in: 8..250 }
end
