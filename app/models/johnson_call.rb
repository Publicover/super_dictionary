class JohnsonCall < ApplicationRecord
  def self.get_sj_token
    @token_response = HTTParty.post('https://samueljohnsonapi.herokuapp.com/auth/login',
      :body => {
        "name": "#{ENV['SUPER_DICTIONARY_NAME']}",
        "email": "#{ENV['SUPER_DICTIONARY_EMAIL']}",
        "password": "#{ENV['SUPER_DICTIONARY_PW']}"
        }
      )

    @sj_token = @token_response['auth_token']
  end
  # include UserInfo

  # def self.johnson_registered?
  #   current_user.sj_registered
  # end

  # def johnson_token_valid?
  #   # check created on date of token
  #   # if more than 24 hours old, renew token
  #   current_user.sj_token < Time.now - 24.hours
  # end

  # def self.johnson_signup
  #   # check if user is signed up
  #   # sign them up if not
  #   # returns token so no need to get it again
  #   response = HTTParty.post('https://samueljohnsonapi.herokuapp.com/signup',
  #     :body => {
  #         "name" => "#{current_user.name}",
  #         "email" => "#{current_user.email}",
  #         "password" => "#{current_user.password}"
  #       }
  #     )
  #   current_user.sj_registered = true
  #   current_user.sj_token = response['auth_token']
  # end

  # def self.johnson_get_token
  #   # check if user is signed up
  #   # if yes, send info to get token
  #   unless johnson_token_valid?
  #     response = HTTParty.post("https://samueljohnsonapi.herokuapp.com/auth/login",
  #       :body => {
  #         "name": "#{ENV['SUPER_DICTIONARY_NAME']}",
  #         "email": "#{ENV['SUPER_DICTIONARY_EMAIL']}",
  #         "password": "#{ENV['SUPER_DICTIONARY_PW']}"
  #       })
  #     current_user.sj_token = response['auth_token']
  #   end
  # end

  def self.johnson_api(term)
    # make a call to johnson api
    # if User.johnson_registered?
    #   User.johnson_get_token
    # else
    #   User.johnson_signup
    # end
    # current_user.johnson_token_valid?
    if @sj_token
      lookup = HTTParty.get("https://samueljohnsonapi.herokuapp.com/words/#{term.capitalize}",
        :headers => {
          "name": "#{ENV['SUPER_DICTIONARY_NAME']}",
          "email": "#{ENV['SUPER_DICTIONARY_EMAIL']}",
          "password": "#{ENV['SUPER_DICTIONARY_PW']}",
          "Authorization": "#{@sj_token}"
        })
      lookup["definition"]
      # "Word not found" if lookup == "null"
    else
      self.get_sj_token
      self.johnson_api("#{term}")
    end
    # lookup['definition']
  end
end
