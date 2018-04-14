class User < ApplicationRecord
  has_secure_password
  validates :password_digest, presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A\S+@.+\.\S+\z/, message: 'Must be email address.' },
            length: { in: 8..250 }

  # def self.johnson_registered?
  #   johnson_registered?
  # end

  # def self.current
  #   Thread.current[:user]
  # end
  #
  # def self.current=(user)
  #   Thread.current[:user] = user
  # end

  # def self.johnson_token_valid?
  #   # check created on date of token
  #   # if more than 24 hours old, renew token
  #   if user.johnson_registered == false
  #     johnson_signup
  #     true
  #   else
  #     true if johnson_token < Time.now - 24.hours
  #   end
  # end
  #
  # def self.johnson_signup
  #   # check if user is signed up
  #   # sign them up if not
  #   # returns token so no need to get it again
  #   response = HTTParty.post('https://samueljohnsonapi.herokuapp.com/signup',
  #     :body => {
  #         "name" => "super_dictionary",
  #         "email" => "#{email}",
  #         "password" => "#{password}"
  #       }
  #     )
  #   johnson_registered = true
  #   johnson_token = response['auth_token']
  # end
  #
  # def self.johnson_get_token
  #   # check if user is signed up
  #   # if yes, send info to get token
  #   unless johnson_token_valid?
  #     response = HTTParty.post("https://samueljohnsonapi.herokuapp.com/auth/login",
  #       :body => {
  #         "name": "super_dictionary",
  #         "email": "#{email}",
  #         "password": "#{password}"
  #       })
  #     johnson_token = response['auth_token']
  #   end
  # end
end
