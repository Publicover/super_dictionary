# rules for contacting the oxford API
# require 'HTTParty'

class OxfordCall < ApplicationRecord
  include HTTParty
  serialize :definitions, JSON
  # TODO: SERIALIZE

  def self.oxford_api(term)
    call_url = "https://od-api.oxforddictionaries.com:443/api/v1/entries/en/#{term}"
    response = HTTParty.get(call_url,
      { headers: {
        "Accept": "application/json",
        "app_id": "#{ENV['OXFORD_APP_ID']}",
        "app_key": "#{ENV['OXFORD_APP_KEY']}" }
      })

    if response.include?("!DOCTYPE")
      "NO DEFINITION"
    else
      defs = []
      def_block = response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"]
      def_block.each do |word|
        defs << word["definitions"]
      end
      defs
    end
  end
end
