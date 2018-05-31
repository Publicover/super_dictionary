class WebsterCall < ApplicationRecord
  def self.webster_api(term)
    response = HTTParty.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{term}?key=#{ENV["WEBSTER_KEY"]}")
    if response.include?("suggestion")
      "FAILED"
    else
      # defs = []
      doc_response = Nokogiri::XML(response)
      doc_response.xpath('//def//dt/text()')#.text.split(':')#.each do |string|
      #   defs << string.capitalize
      # end
      # defs
    end
  end
end
