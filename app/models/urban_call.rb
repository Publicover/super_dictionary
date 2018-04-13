class UrbanCall < ApplicationRecord
  include HTTParty
  include Nokogiri
  # include JSON

  def self.urban_api(term)
    response = HTTParty.get("https://mashape-community-urban-dictionary.p.mashape.com/define?term=#{term}",
      headers:{
        "X-MASHAPE-KEY": "#{ENV["MASHAPE_TEST_KEY"]}",
        "Accept": "text/plain"
        })

    # response = JSON.parse(raw_response)

    if response["result_type"] == "no_results"
      "NOPE"
    else
      defs = []
      # response["list"][0]["definition"]
      # if response["tags"]["list"] == "definition"
      #   defs << response["tags"]["list"]
      # end
      # parsed_response = JSON.parse(response.body)
      response["list"].each do |item|
        # if item == "definition"
          defs << item["definition"]
        # end
        # puts defs
        # puts item["definition"]
      end
      defs
    end
  end
end
