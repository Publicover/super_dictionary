module Oxford
  # self is module oxford
  def self.oxford_call(word)
    @oxford_response = HTTParty.get("https://od-api.oxforddictionaries.com:443/api/v1/entries/en/#{word}",
      :headers => {
        "Accept": "application/json",
        "app_id": "#{ENV['OXFORD_APP_ID']}",
        "app_key": "#{ENV['OXFORD_APP_KEY']}"
      })

    if @oxford_response.include?('!DOCTYPE')
      @oxford_defs = 'Word not found'
    else
      @oxford_defs = []
      @oxford_def_block = @oxford_response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"]
      @oxford_def_block.each do |word|
        @oxford_defs << word["definitions"].shift.strip.capitalize
      end
      # @oxford_defs = @oxford_response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"]
    end
    @oxford_defs
  end

  # def oxford_call(word)
  # end

end
