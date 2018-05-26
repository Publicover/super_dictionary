# rules for contacting the oxford API
# require 'HTTParty'

class OxfordCall < ApplicationRecord
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
      response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"].each do |ary|
        ary.each do |k, v|
          defs << "#{v[0].capitalize}" if k == "definitions"
          defs << "Subsense: #{v[0]['definitions'][0]}" if k == 'subsenses'
        end
      end
      # response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"].each do |ary|
      #   ary.each do |k, v|
      #     defs << v if k == "definitions"
      #     defs << "Subsense: #{v[0]['definitions'][0]}" if k == 'subsenses'
      #   end
      # end
      #
      # response["results"][0]["lexicalEntries"][1]["entries"][0]["senses"].each do |ary|
      #   ary.each do |k, v|
      #     defs << v if k == "definitions"
      #     defs << "Subsense: #{v[0]['definitions'][0]}" if k == 'subsenses'
      #   end
      # end
      defs
    end
  end
end
