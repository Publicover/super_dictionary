class WebsterCall < ApplicationRecord
  include HTTParty
  include Nokogiri

  def self.webster_api(term)
    response = HTTParty.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{term}?key=#{ENV["WEBSTER_KEY"]}")
    if response.include?("suggestion")
      "FAILED"
    else
      defs = []
      doc_response = Nokogiri::XML(response)
      defs << doc_response.css('dt').text.gsub!(':', "\n")
    end
  end
end
