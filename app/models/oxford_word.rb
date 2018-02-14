class OxfordWord < ApplicationRecord
  belongs_to :user

  def initialize(word)
    @oxford_response = HTTParty.get("https://od-api.oxforddictionaries.com:443/api/v1/entries/en/#{@word}",
      :headers => {
        "Accept": "application/json",
        "app_id": "#{ENV['OXFORD_APP_ID']}",
        "app_key": "#{ENV['OXFORD_APP_KEY']}"
      })
  end

  def oxford_def
    if @oxford_response.include?("!DOCTYPE")
      'Word not found'
    else
      @oxford_defs = []
      @oxford_def_block = @oxford_response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"]
      @oxford_def_block.each do |word|
        @oxford_defs << word["definitions"]
      end
    end
  end

  # def oxford_def
  #   # if @oxford_response.include?("!DOCTYPE")
  #   #   'Word not found'
  #   # else
  #   #   oxford_defs = []
  #   #   oxford_def_block = @oxford_response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"]
  #   #   # oxford_def_block.each do |word|
  #   #   #   defs << word["definitions"]
  #   #   # end
  #   # end
  # end
end
