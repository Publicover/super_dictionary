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
    # @sj_token_time = Time.now
  end

  def self.johnson_api(term)
    if @sj_token #&& @sj_token_time < Time.now - 24.hours
      lookup = HTTParty.get("https://samueljohnsonapi.herokuapp.com/words/#{term.capitalize}",
        :headers => {
          "name": "#{ENV['SUPER_DICTIONARY_NAME']}",
          "email": "#{ENV['SUPER_DICTIONARY_EMAIL']}",
          "password": "#{ENV['SUPER_DICTIONARY_PW']}",
          "Authorization": "#{@sj_token}"
        })
      lookup["definition"]
      # if lookup.body == "null"
      #   return "That definition does not exist. Blame the year 1775."
      # end
    else
      self.get_sj_token
      self.johnson_api("#{term}")
    end
  end
end
