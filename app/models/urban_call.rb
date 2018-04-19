class UrbanCall < ApplicationRecord
  def self.urban_api(term)
    response = HTTParty.get("https://mashape-community-urban-dictionary.p.mashape.com/define?term=#{term}",
      headers:{
        "X-MASHAPE-KEY": "#{ENV["MASHAPE_TEST_KEY"]}",
        "Accept": "text/plain"
        })

    if response["result_type"] == "no_results"
      "NOPE"
    else
      defs = []
      response["list"].each do |item|
          defs << item["definition"]
      end
      defs
    end
  end
end
